#!/bin/sh

if [ $# -le 0 ]; then
	./exakat version
	exit 0	
fi

# Option defaults
URL=""
format="Diplomat"

# getopts string
# This string needs to be updated with the single character options (e.g. -f)
opts="p:R:f:"

# Gets the command name without path
cmd(){ echo `basename $0`; }

# Help command output
usage(){
echo "\
`cmd` [OPTION...]
-p; project name
-R; URL of the repository
-f, --format; audit output
" | column -t -s ";"
}

# Error message
error(){
    echo "`cmd`: invalid option -- '$1'";
    echo "Try '`cmd` -h' for more information.";
    exit 1;
}

command=$1;
shift 1;

if [ "$command" != "project" ]; then
	./exakat $command $@
	exit 0
fi

# There's two passes here. The first pass handles the long options and
# any short option that is already in canonical form. The second pass
# uses `getopt` to canonicalize any remaining short options and handle
# them
for pass in 1 2; do
    while [ -n "$1" ]; do
        case $1 in
            --) shift; break;;
            -*) case $1 in
                -R)     URL=$2; shift;;
                -p)     project=$2; shift;;
                -f|--format)  format=$2; shift;;
                --*)           error $1;;
                -*)            if [ $pass -eq 1 ]; then ARGS="$ARGS $1";
                               else error $1; fi;;
                esac;;
            *)  if [ $pass -eq 1 ]; then ARGS="$ARGS $1";
                else error $1; fi;;
        esac
        shift
    done
    if [ $pass -eq 1 ]; then ARGS=`getopt $opts $ARGS`
        if [ $? != 0 ]; then usage; exit 2; fi; set -- $ARGS
    fi
done

# Handle positional arguments
if [ -n "$*" ]; then
    echo "`cmd`: Extra arguments -- $*"
    echo "Try '`cmd` -h' for more information."
    exit 1
fi

if [ ! -f "./projects/$project" ]; then
	if [ ! -z "$URL" ]; then
		./exakat init -p $project -R $URL
	fi
fi

exakat project -p $project --format $format

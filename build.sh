#compile 
docker build --no-cache -t exakat/exakat:0.10.2 .

#run
docker run -t \
--net=none \
--privileged=false \
--cap-drop=ALL \
--user=docker \
--rm=true \
-v ($pwd)/projects/codacy/code:/src:ro \
exakat/codacy:0.10.2
#compile 
docker build --no-cache -t exakat/codacy:0.10.3 .

#run
docker run -t \
--net=none \
--privileged=false \
--cap-drop=ALL \
--user=docker \
--rm=true \
-v $(pwd)/projects/api/code:/src:ro \
exakat/codacy:0.10.3

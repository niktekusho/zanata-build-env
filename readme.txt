How to

docker build -t zanata-builder .

(substitute your desired paths after the -v option)
docker run -it -v {zanatasources}:{containerpath} zanata-builder


IMPORTANT: If build fails, checkout https://stackoverflow.com/questions/41022393/mount-point-not-found
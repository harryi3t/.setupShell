shipRestart() {
  sudo docker stop -t=0 `docker ps -aq`
  docker rm `docker ps -aq`
  cd /home/harry/shippable/one/
  ./oneup --all
  cd ../api/
  ./one
  cd ../www/
  ./one
}

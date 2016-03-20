export SHIPABLE_DIR='/home/harryi3t/work/shippable'

shipRestart() {
  sudo docker stop -t=0 `docker ps -aq`
  docker rm `docker ps -aq`
  cd  $SHIPABLE_DIR/one/
  ./oneup --all
  cd ../api
  ./one
  cd ../www/
  ./one
  grunt buildLocal && grunt watch
}

debug() {
  COMPONENT=$1
  ENV_PATH="$SHIPABLE_DIR/one/components/${COMPONENT}.env"
  if [ ! -f $ENV_PATH ]; then
    echo "${COMPONENT} is not a valid component."
    echo 'exiting...'
  else
    PORT=$(grep NODEINSPECTOR_PORT $ENV_PATH | awk -F = '{print $2}')
    DEBUG_PORT=$(grep NODEINSPECTOR_DEBUG_PORT  $ENV_PATH | awk -F = '{print $2}')
    echo $PORT $DEBUG_PORT
    google-chrome http://localhost:$PORT/\?port\=$DEBUG_PORT
  fi
}

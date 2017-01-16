export SHIPABLE_DIR='/home/harry/work/shippable'

shipRestart() {
  sudo service postgresql stop
  sudo service redis-server stop
  docker rm -f `docker ps -aq`
  cd "$SHIPABLE_DIR/base"
  rm -f usr/state.json.*
  cp state.json usr/state.json
  sudo ./base.sh -i local
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

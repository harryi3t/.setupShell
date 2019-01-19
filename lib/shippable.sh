export SHIPABLE_DIR='/home/harry/work/shippable'

shipRestart() {
  sudo service postgresql stop
  sudo service redis-server stop
  docker rm -f `docker ps -aq`
  cd "$SHIPABLE_DIR/base"
  cp state.json usr/state.json
  sudo ./base.sh install --local
  addProcs
}

addProcs() {
  # cd "$SHIPABLE_DIR/base"
  sudo ./myScript.sh 
}

useNgrok() {
  sed -i "s,urlParse.parse(.*);,urlParse.parse('$(curl -s localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')');,g" resources/post.js  && cat resources/post.js | grep 'var parsedUrl' -A 1
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

dTail() {
  component=$1
  docker logs -f --tail=100  `docker ps | grep $component | awk {'print $1'}`
}
dStop() {
  component=$1
  componentID=`docker ps | grep $component | awk {'print $1'}`
  # non empty
  if [ ! -z $componentID ]
  then
   docker stop -t=0 $componentID
  else
   echo 'No container found with name $component'
  fi
}
dStart() {
  component=$1
  docker restart `docker ps -a | grep $component | awk {'print $1'}`
}
dRestart() {
  component=$1
  dStop $component
  dStart $component
 }

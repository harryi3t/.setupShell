alias gpl="git pull main develop"
alias gd="git dsf" 
alias gf="git fetch main develop"
alias gro="git rebase origin/develop"
alias grm="git rebase main/develop"
git config --global alias.ignore 'update-index --skip-worktree'
git config --global alias.unignore 'update-index --no-skip-worktree'
git config --global alias.ignored '!git ls-files -v | grep "^S"'

function cleanpush() {
  git stash && gf && gr && gp -f && git stash pop
}
function gadd() {
  git add -u && git commit -m "$1" && gp
}

funtion origintomain() {
 hasMain=$(git remote -v  | awk '{print $1}' | grep main)
 hasOrigin=$(git remote -v  | awk '{print $1}' | grep origin)
 mainRemote=$(git remote -v | head -1 | grep -Po '(?<=main\s).*(?=\s\(fetch\))')
 originRemote=$(git remote -v | head -1 | grep -Po '(?<=origin\s).*(?=\s\(fetch\))')

 if [[ $hasMain  ]]
 then
   echo "This repo already has main as a remote"
 else
   git remote remove origin
   git remote add main "$originRemote"
   echo "Updated origin to main"
   git remote -v
 fi


 if [[ (! $hasOrigin) && $hasMain ]]
 then
   originRemote=$(echo $mainRemote | sed 's,git@github.com:\(.*\)/\(.*\).git,git@github.com:harryi3t/\2.git,')
   echo "No Origin found. Do you want '$originRemote' to be added as origin? (y/n)"
   read response
   if [[ $response == 'y' ]]
   then
     git remote add origin "$originRemote"
     echo "Added origin"
     git remote -v
   fi
 fi
}

function webhookDelete() {
  REPO="$1"

  NEW_NGROK_URL="$2"
  MESSAGE="${RED}deleting for url $URL ${NORMAL}"
  if [ "$NEW_NGROK_URL" == '' ];then
    NEW_NGROK_URL='somerandomstringwhichwillnevermatch'
    MESSAGE="$MESSAGE\n\n"
  elif [ "$2" != '--force' ];then
    MESSAGE="$MESSAGE\n${YELLOW}Ignoring the urls containing $NEW_NGROK_URL \n\n${NORMAL}"
  fi

  URL="https://api.github.com/repos/$REPO/hooks?access_token=$TOKEN"

  echo "$MESSAGE"

  result=$(curl $URL)

  if [ "$2" != "--force" ];then
    result=`$(echo result | grep --exclude-dir={.bzr,CVS,.git,.hg,.svn} -E '("id"|172.17.42.1|ngrok|192.168|127.0.0)')`
    if [ "$2" != '' ];then
      result=`echo $result | grep -v "$NEW_NGROK_URL"`
    fi
  fi

  echo result | grep '"url"' -B 1 | grep '"id"' | awk -F , '{print $1}' | awk '{print $2}' | while read id
  do
    DELETE_URL="https://api.github.com/repos/$REPO/hooks/$id?access_token=$TOKEN"
    echo "${YELLOW}Deleting $id${NORMAL}"
    curl -sX DELETE $DELETE_URL
  done
}

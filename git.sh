alias gpl="git pull main master"
alias gf="git fetch main master"
alias gr="git rebase main/master"
alias gph="git push origin master"
alias gm="git add . && git commit --amend --no-edit"

function webhookDelete() {
  REPO="$1"
  NEW_NGROK_URL="$2"
  MESSAGE="${RED}deleting for url $URL ${NORMAL}"
  if [ "$NEW_NGROK_URL" == '' ];then
    NEW_NGROK_URL='somerandomstringwhichwillnevermatch'
    MESSAGE="$MESSAGE\n\n"
  else
    MESSAGE="$MESSAGE\n${YELLOW}Ignoring the urls containing $NEW_NGROK_URL \n\n${NORMAL}"
  fi

  URL="https://api.github.com/repos/$REPO/hooks?access_token=$TOKEN"

  echo "$MESSAGE"

  curl $URL | grep --exclude-dir={.bzr,CVS,.git,.hg,.svn} -E '("id"|172.17.42.1|ngrok)' |  grep -v "$NEW_NGROK_URL" | grep '"url"' -B 1 | grep '"id"' | awk -F , '{print $1}' | awk '{print $2}' | while read id
  do
    DELETE_URL="https://api.github.com/repos/$REPO/hooks/$id?access_token=$TOKEN"
    echo "${YELLOW}Deleting $id${NORMAL}"
    curl -X DELETE $DELETE_URL
  done
}

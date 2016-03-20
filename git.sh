alias gpl="git pull main master"
alias gf="git fetch main master"
alias gr="git rebase main/master"
alias gph="git push origin master"

function webhookDelete() {
  REPO="$1"
  URL="https://api.github.com/repos/$REPO/hooks?access_token=$TOKEN"
  ​
  echo "${RED}deleting for url $URL \n\n${NORMAL}"
  curl $URL | grep '"id"' | awk -F , '{print $1}' | awk '{print $2}' | while read id
  do
     DELETE_URL="https://api.github.com/repos/$REPO/hooks/$id?access_token=$TOKEN"
     echo "${YELLOW}Deleting $id${NORMAL}"
     curl -X DELETE $DELETE_URL
  ​
   done
}

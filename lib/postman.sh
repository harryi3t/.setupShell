unit-test () {
 BABEL_ENV=test ./node_modules/.bin/mocha ./js/modules/_tests/_bootstrap-models.test.js "$1" --opts ./tests/unit/mocha-unit.opts
}
unit-test-nyc () {
 BABEL_ENV=test ./node_modules/.bin/nyc ./node_modules/.bin/mocha ./js/modules/_tests/_bootstrap-models.test.js "$1" --opts ./tests/unit/mocha-unit.opts
 ./node_modules/.bin/nyc report --reporter=html
}

function postman() {
 if [[ "$1" == "stash" ]]; then
   mv ~/Library/Application\ Support/Postman ~/Library/Application\ Support/Postman.bk   
 fi

 if [[ "$1" == "stash pop" ]]; then
   mv ~/Library/Application\ Support/Postman.bk ~/Library/Application\ Support/Postman
 fi
}

function pm-stash() {
  rm -rf ~/Library/Application\ Support/Postman"$1".old
  mkdir ~/Library/Application\ Support/Postman"$1".old
  cp -R ~/Library/Application\ Support/Postman"$1"/* ~/Library/Application\ Support/Postman"$1".old/
  rm -rf ~/Library/Application\ Support/Postman"$1"
}

function pm-stash-pop() {
  rm -rf ~/Library/Application\ Support/Postman"$1"
  mkdir ~/Library/Application\ Support/Postman"$1"
  cp -R ~/Library/Application\ Support/Postman"$1".old/* ~/Library/Application\ Support/Postman"$1"/
  rm -rf ~/Library/Application\ Support/Postman"$1".old
}

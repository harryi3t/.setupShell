alias ngrep="grep -nr \
  --exclude=\*.{min,cat}.js \
  --exclude=\*.log \
  --exclude=\*.pdf \
  --exclude=\*bundle.js\* \
  --exclude-dir=\*assets\* \
  --exclude-dir=\*dist\* \
  --exclude-dir=\*node_modules\* \
  --color=always \
  "

alias strip="perl -pe 's/\x1b.*?[mGKH]//g'"

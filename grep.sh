alias ngrep="grep -nr \
  --exclude=\*.{min,cat}.js \
  --exclude=\*.log \
  --exclude=\*.pdf \
  --exclude-dir=\*node_modules\* \
  --exclude-dir=\*assets\* \
  --exclude-dir=\*node_modules\* \
  "

#!/bin/bash

apps=(
  "code-inspect-frontend"
  "code-inspect-backend"
)

for app in "${apps[@]}"; do
  _appname="_${app#code-inspect-}"

  git clone "https://github.com/vahan-sahakyan/$app.git" $_appname
  echo "✅ Finished cloning $app into $_appname"
done

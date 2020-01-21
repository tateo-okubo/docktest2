#!/bin/sh

pip install -r requirements.txt

echo "====== end pip install ======"

if [ -n "$GITHUB_ACTIONS" ]; then
mkdocs serve --dev-addr=0.0.0.0:8000
else
mkdocs build
# siteに.githubを入れ込む
cp -r .github ./site
fi

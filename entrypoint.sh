#!/bin/sh

pip install -r requirements.txt

echo "====== end pip install ======"

if [ "$GITHUB_ACTIONS" != "true" ]; then
mkdocs serve --dev-addr=0.0.0.0:8000
else
mkdocs build
echo "copy .github"
touch /docs/site/.nojekyll
cp -r .github /docs/site
fi

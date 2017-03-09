#!/bin/bash
buster generate --domain=http://ghost:2368
curl -o static/talks/index.html http://ghost:2368/talks/
curl -o static/rss/index.html http://ghost:2368/rss/

echo "Fixing links to https"
find static -name *.html -type f -exec sed -i -e 's#http://localhost:2368#http://blog.shrikrishnaholla.in#g' {} \;
find static -name *.html -type f -exec sed -i -e 's#http://fonts.googleapis.com#https://fonts.googleapis.com#' {} \;

echo "Fixing some blog posts"
find static -name *.html -type f -exec sed -i -e 's#open http://blog.shrikrishnaholla.in#open http://localhost:2368#g' {} \;
find static -name *.html -type f -exec sed -i -e 's#domain=http://blog.shrikrishnaholla.in#domain=http://localhost:2368#g' {} \;
find static -name *.html -type f -exec sed -i -e 's#s\#http://blog.shrikrishnaholla.in#s\#http://localhost:2368#g' {} \;

echo "Removing index.html from links"
find static -name *.html -type f -exec sed -i -e 's#/index.html#/#g' {} \;

echo "Fixing some xmls"
find static -name *.xml -type f -exec sed -i -e 's#http://localhost:2368#http://blog.shrikrishnaholla.in#g' {} \;

echo "Fixing robots.txt"
find static -name robots.txt -type f -exec sed -i -e 's#http://localhost:2368#http://blog.shrikrishnaholla.in#g' {} \;

if [ "$1" == "--deploy" ]; then
  buster deploy
fi

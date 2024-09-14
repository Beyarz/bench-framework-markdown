cd jekyll/my-jekyll-site

mkdir -p _pages

jekyll clean
rm -rf _pages/*.md
echo "[bench] Clean complete"

if [ -z "$1" ]
  then count="1000"
else
  count="$1"
fi

cp ../../_markdown-samples/$count/* _pages/
echo "[bench] Setup complete $count pages"

time jekyll build
echo "[bench] Build complete $count pages"

echo "[bench] Framework version"
jekyll --version

rm -rf _pages/*.md
echo "[bench] Posts cleanup complete"

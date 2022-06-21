#!/usr/bin/bash
rm -r docs
sphinx-build src docs
cd docs
mv images images
mv sources sources
mv static static
find . -name \* -exec sed -i "s/images/images/g" {} \;
find . -name \* -exec sed -i "s/sources/sources/g" {} \;
find . -name \* -exec sed -i "s/static/static/g" {} \;
cd ..
sphinx-build  -b latex  src  build
cd build
make
mv GOMC.pdf ..
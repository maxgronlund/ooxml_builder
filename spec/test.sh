!#/bin/bash

rm -rf ../samples/pptx/*
cd ../
rspec spec
cd samples/pptx
cp  sample.pptx sample.zip
unzip sample.zip

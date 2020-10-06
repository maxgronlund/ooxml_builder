!#/bin/bash


rm -rf ../samples/pptx/*

cd ../
rspec spec
cd samples/pptx
cp  sample.pptx sample.zip
unzip sample.zip
cd ppt/embeddings


zip -r Microsoft_Excel_Worksheet.zip Microsoft_Excel_Worksheet
cp Microsoft_Excel_Worksheet.zip Microsoft_Excel_Worksheet-test.xlsx

# open 'Microsoft_Excel_Worksheet1.xml'

ls -al
# zip -r Microsoft_Excel_Worksheet.zip Microsoft_Excel_Worksheet
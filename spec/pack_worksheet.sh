!#/bin/bash
# pack worksheet for inspection.
cd ../samples/pptx/ppt/embeddings
zip -r Microsoft_Excel_Worksheet.zip Microsoft_Excel_Worksheet
rm -rf Microsoft_Excel_Worksheet1.xlsx Microsoft_Excel_Worksheet
cp Microsoft_Excel_Worksheet.zip Microsoft_Excel_Worksheet.xlsx
unzip Microsoft_Excel_Worksheet.zip

open .

ls -al
# cp  sample.pptx sample.zip
# unzip sample.zip
# rm sample.zip



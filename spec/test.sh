!#/bin/bash
# Clean up output folder
rm -rf ../samples/pptx/*
# Run rspec
cd ../
rspec spec
cd spec
# Uncomment this line to inspect outcome
#./unpack_output.sh

# Open file in application
open ../samples/pptx/sample.pptx




# zip -r Microsoft_Excel_Worksheet.zip Microsoft_Excel_Worksheet
# cp Microsoft_Excel_Worksheet.zip Microsoft_Excel_Worksheet-test.xlsx
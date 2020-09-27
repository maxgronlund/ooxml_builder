`ooxml_builder` is a Ruby gem that can generate PowerPoint files with Embedded excel charts.

## Basic Usage

See specs for basic usage

Run
```
rspec spec && open samples/pptx/sample.pptx
```
to test output

## Needs to be implemented


- workbook.rb class: 
  - Needs to make the generation of Excel files dynamic, I.E, use a template
    - We should generate excel file from an excel templates, just as we are using a powerpoint template to generate the .pptx
    - We need to be able to specify what data is inserted in the excel slide dynamically, see an example how how this could be done in the specs

- Needs to support line and pie charts as well.





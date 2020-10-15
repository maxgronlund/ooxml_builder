# compiled output compared to original document
I have created a project with one slide and unpacked it.
I have build the same document, and unpack that too.


Now I'm comparing the files in the generated out put to the files in the original document


[Content_Types].xml √
_rel
  .rel √
docProps
  app.xml - nothing significant
  core.xml - a timestamp at line 13
ppt
  _rels
    presentation.xml.rels - changes in id's due to slide index, seems ok
    presentation.xml.rels - changes in id's due to slide index, seems ok
charts
  _rels
    chart1.xml.rel - seems ok changes rId3 worksheet relation
  chart1 √

slides
  _rels
    slide.xml.rel √
  slide1.xml - noting significant onely labels and positions


Embeddings
  Microsoft_Excell_Worksheet
    [ContentTypes].xls √
    _rels
      .rel √
    docProps
      app.xml √
      core.xml √ only createor and modifyer and timestamp has changed
    xl
      _rel
        workbook.xml.rels √
      workbook.xml √

require 'csv'

module TestFixture
  def self.data

    chart1_csv =
    CSV.parse(
'Column1,Development
April, 2020,"22.000 "
July, 2020,"55.000 "
October, 2020,"15.000"
January, 2020,"5.000"')

    chart2_csv =
    CSV.parse(
'Column1,Reach
male 18-24,"3,000"
female 18-24,"2,000"
male 25-34,"4,000"
female 25-34,"2,000"
male 35-44,"5,000"
female 35-44,300
male 45-54,"3,600"
female 45-54,899')

    chart_style = {
      "color" => "#0088ff"
    }

    {
      "version" => 1.0,
      "save_path" => "samples/pptx/",
      "file_name" => "test.pptx",
      "slides" => [
        {
          "title" => "Development",
          "subtitle" => "Spend",
          "type" => "graph",
          "chart_style" => chart_style,
          "sheet_data" => {
            "data" => chart1_csv
          }
        },
        {
          "title" => "Demographic",
          "subtitle" => "Spend",
          "type" => "vertical_bars",
          "chart_style" => chart_style,
          "work_sheet_data" => {
            "data" => chart2_csv,
            "suffix" => ".kr"
          }
        }
      ]
    }
  end
end
require 'csv'

module TestFixture


  def self.chart1
    [
      ['Column1','Development'],
      ['April, 2020',22000],
      ['July, 2020',55000],
      ['October, 2020',15000],
      ['January, 2020',5000]
    ]
  end

  def self.chart2
    [
      ['Column1', 'Reach'],
      ['male 18-24', 3000],
      ['female 18-24', 2000],
      ['male 25-34', 4000],
      ['female 25-34', 2000],
      ['male 35-44', 5000],
      ['female 35-44', 300],
      ['male 45-54', 3600],
      ['female 45-54', 899]
    ]

  end

  def self.style
    # Dummy style
    style = {
      "color" => "#0088ff"
    }
  end

  def self.grap_chart
    {
      "version" => 1.0,
      "title" => "Development",
      "subtitle" => "Spend",
      "type" => "graph",
      "style" => style,
      "data" => chart1
    }
  end

  def self.bar_chart
    data =

    # Dummy style
    style = {
      "color" => "#0088ff"
    }

    {
      "version" => 1.0,
      "title" => "Development",
      "subtitle" => "Spend",
      "type" => "bar",
      "style" => style,
      "data" => chart2
    }
  end
end
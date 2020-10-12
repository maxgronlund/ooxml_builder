require 'csv'

module TestFixture

  def self.graph_data
    {
      'Column1': 'Development',
      'April, 2020': 22000,
      'July, 2020': 55000,
      'October, 2020': 15000,
      'January, 2020': 5000
    }
  end

  def self.bar_data
    {
      'Column1': 'Reach',
      'male 18-24': 1250,
      'female 18-24': 2000,
      'male 25-34': 4000,
      'female 25-34': 2000,
      'male 35-44': 5000,
      'female 35-44': 300,
      'male 45-54': 3600,
      'female 45-54': 899
    }
  end

  def self.graph_chart
    {
      'version': 1.0,
      'title': 'Développement',
      'subtitle': 'Atteindre',
      'period': 'Durée de vie',
      'type': 'graph',
      'data': graph_data,
      'suffix': '€.'
    }
  end

  def self.key_insights_data
    [
      {'title': 'Demographic', 'img': 'male', 'subtitle': 'Male 25-34', 'spend': 1368},
      {'title': 'Device', 'img': 'mobile', 'subtitle': 'Mobile app', 'spend': 4443},
      {'title': 'Platform', 'img': 'fb', 'subtitle': 'facebook', 'spend': 2534},
      {'title': 'Ad Set', 'img': 'ad', 'subtitle': 'Change the world by being yourself', 'spend': 3643},
      {'title': 'Ad', 'img': 'ad-set', 'subtitle': 'Simplicity is the ultimate sophistication', 'spend': 1523}
    ]
  end

  def self.bar_chart
    {
      'version': 1.0,
      'title': 'Demographisch',
      'subtitle': 'Verbringen',
      'period': 'Lebenszeit',
      'type': 'bar',
      'data': bar_data,
      'suffix': 'EUR.'
    }
  end

  def self.key_insights
    {
      'version': 1.0,
      'title': 'Key insights',
      'subtitle': 'Spend',
      'period': 'Lifetime',
      'type': 'key_insights',
      'data': key_insights_data,
      'suffix': 'EUR'
    }
  end
end

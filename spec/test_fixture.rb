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

  def self.graph_chart
    {
      'version': 1.0,
      'title': 'Développement',
      'subtitle': 'Atteindre',
      'period': 'Durée de vie',
      'data': graph_data,
      'suffix': '€.'
    }
  end

  def self.bar_data
    {
      'Column1': 'Reach',
      'männlich 18-24': 1250,
      'weiblich 18-24': 2000,
      'männlich 25-34': 4000,
      'weiblich 25-34': 2000,
      'männlich 35-44': 5000,
      'weiblich 35-44': 300,
      'männlich 45-54': 3600,
      'weiblich 45-54': 899
    }
  end

  def self.bar_chart
    {
      'version': 1.0,
      'title': 'Demographisch',
      'subtitle': 'Verbringen',
      'period': 'Lebenszeit',
      'data': bar_data,
      'suffix': 'EUR.'
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

  def self.key_insights
    {
      'version': 1.0,
      'title': 'Key insights',
      'subtitle': 'Spend',
      'period': 'Lifetime',
      'data': key_insights_data,
      'suffix': 'EUR'
    }
  end

  def self.results_data
    [
      { 'title': 'Spend', 'img': 'sack-dollar', 'cur-val': 5008, 'prev-val': 1000 },
      { 'title': 'Reach', 'img': 'users', 'cur-val': 8631, 'prev-val': 9632 },
      { 'title': 'Frequency', 'img': 'rotating-arrows', 'cur-val': 2.34, 'prev-val': 3.31 },
      { 'title': 'CPC', 'img': 'dollar-arrow', 'cur-val': 5008, 'prev-val': 1000 },
      { 'title': 'App Installs', 'img': 'app-install', 'cur-val': 543, 'prev-val': 654 },
      { 'title': 'Cost per App Install', 'img': 'dollar-app-install', 'cur-val': 75, 'prev-val': 85 }
    ]
  end

  def self.results
    {
      'version': 1.0,
      'title': 'Results',
      'subtitle': '',
      'period': 'As long as you like',
      'data': results_data,
      'suffix': 'Yen'
    }
  end
end

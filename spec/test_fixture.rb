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

  def self.graph
    {
      'version': 1.0,
      'title': 'Développement',
      'subtitle': 'Atteindre',
      'period': 'Durée de vie',
      'data': graph_data,
      'reach': '97.000'
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

  def self.bar
    {
      'version': 1.0,
      'title': 'Demographisch',
      'subtitle': 'Verbringen',
      'period': 'Lebenszeit',
      'data': bar_data,
      'suffix': 'EUR.'
    }
  end

  def self.insights_data
    [
      {'title': 'Demographic', 'img': 'male', 'subtitle': 'Male 25-34', 'spend': 1368},
      {'title': 'Device', 'img': 'mobile', 'subtitle': 'Mobile app', 'spend': 4443},
      {'title': 'Platform', 'img': 'fb', 'subtitle': 'facebook', 'spend': 2534},
      {'title': 'Ad Set', 'img': 'ad', 'subtitle': 'Change the world by being yourself', 'spend': 3643},
      {'title': 'Ad', 'img': 'ad-set', 'subtitle': 'Simplicity is the ultimate sophistication', 'spend': 1523}
    ]
  end

  def self.insights
    {
      'version': 1.0,
      'title': 'Key insights',
      'subtitle': 'Spend',
      'period': 'Lifetime',
      'data': insights_data,
      'suffix': 'EUR'
    }
  end

  def self.results_data
    [
      { 'title': 'Spend', 'img': 'sack-dollar', 'cur_val': 5008, 'prev_val': 1000, arrow: 'green-up'},
      { 'title': 'Reach', 'img': 'users', 'cur_val': 8631, 'prev_val': 9632, arrow: 'gray-up' },
      { 'title': 'Frequency', 'img': 'rotating-arrows', 'cur_val': 2.34, 'prev_val': 3.31, arrow: 'green-up' },
      { 'title': 'CPC', 'img': 'dollar-arrow', 'cur_val': 5008, 'prev_val': 1000, arrow: 'gray-down' },
      { 'title': 'App Installs', 'img': 'app-install', 'cur_val': 543, 'prev_val': 654, arrow: 'red-down'},
      { 'title': 'Cost per App Install', 'img': 'dollar-app-install', 'cur_val': 75, 'prev_val': 85, arrow: 'down'}
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

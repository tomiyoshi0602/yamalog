class Area < ActiveHash::Base
  self.data = [
    { id: 1, name: 'select area' },
    { id: 2, name: '北海道'},
    { id: 3, name: '東北'},
    { id: 4, name: '南関東'},
    { id: 5, name: '北関東・甲信'},
    { id: 6, name: '北陸'},
    { id: 7, name: '東海'},
    { id: 8, name: '近畿'},
    { id: 9, name: '中国'},
    { id: 10, name: '四国'},
    { id: 11, name: '九州・沖縄'},
  ]

  include ActiveHash::Associations
  has_many :posts

end

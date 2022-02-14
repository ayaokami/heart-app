class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '心不全とは' },
    { id: 3, name: '症状の観察方法' },
    { id: 4, name: '飲水' },
    { id: 5, name: '食事' },
    { id: 6, name: '排便' },
    { id: 7, name: '入浴' },
    { id: 8, name: '性' },
    { id: 9, name: '運動' },
    { id: 10, name: '内服' },
    { id: 11, name: '風邪や感染症との関連' },
    { id: 12, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :columns
  end
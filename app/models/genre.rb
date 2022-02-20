class Genre < ActiveHash::Base
  self.data = [
    # { id: 1, name: '--' }, 初期値へ置き換える
    { id: 2, name: '心不全とは' },
    { id: 3, name: '症状の観察方法' },
    { id: 4, name: '受診の目安' },
    { id: 5, name: '体重管理' },
    { id: 6, name: '飲水・食事' },
    { id: 7, name: '排便' },
    { id: 8, name: '入浴' },
    { id: 9, name: '運動・性' },
    { id: 10, name: '内服' },
    { id: 11, name: '風邪や感染症との関連' },
    { id: 12, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :columns
end

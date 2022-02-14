# 以下の管理者用データを保存するには、% rails db:seed コマンドを実行
# 環境変数を読み込む記述に変更

User.create!(
  nickname:              "管理者",
  email:                 ENV['EMAIL'],
  password:              ENV['PASSWORD'],
  password_confirmation: ENV['PASSWORD'],
  last_name_kana:        "ハート",
  first_name_kana:       "タロウ",
  target_weight:         60.0,
  age:                   30,
  water_restriction:     1500,
  admin: true)

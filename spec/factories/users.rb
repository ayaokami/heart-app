FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '000000' }
    password_confirmation { password }
    last_name_kana        { 'テスト' }
    first_name_kana       { 'テスト' }
    target_weight         { 50.2 }
    age                   { 25 }
    water_restriction     { 1000 }
    admin                 { 0 }
  end
end

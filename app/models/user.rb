class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :columns

  with_options presence: true do
    validates :nickname, length: { maximum: 6 }
    validates :target_weight, length: { maximum: 5 }
    validates :age, length: { maximum: 3 }
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナを使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :water_restriction, length: { maximum: 4 }
end

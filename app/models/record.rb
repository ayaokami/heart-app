class Record < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :kt, length: { maximum: 4 }
    validates :pulse, length: { maximum: 3 }
    validates :systolic, length: { maximum: 3 }
    validates :diastolic, length: { maximum: 3 }
    validates :bw, length: { maximum: 5 }
    validates :start_time
  end

  # boolean型の場合、真偽値なのでtrueもfalseも入力されるため presence: true は使えない
  validates :palpitation, inclusion: [true, false]
  validates :suffocation, inclusion: [true, false]
  validates :swelling, inclusion: [true, false]
  validates :fatigue, inclusion: [true, false]
end

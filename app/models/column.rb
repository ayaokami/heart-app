class Column < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :user

  # 空の投稿を保存できないようにする
  validates :title, :text, :genre_id, presence: true

  # ジャンルの選択が「--」の時は保存できないようにする →初期値設定へ変更のためコメントアウト
  # validates :genre_id, numericality: { other_than: 1, message: ' を選択してください ' }
end

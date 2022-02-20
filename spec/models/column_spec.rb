require 'rails_helper'

RSpec.describe Column, type: :model do
  before do
    @column = FactoryBot.build(:column)
  end

  describe 'コラム投稿' do
    context 'コラムが投稿できる場合' do
      it 'すべての欄を入力し、管理者であれば投稿できる' do
        expect(@column).to be_valid
      end
    end

    context 'コラムが投稿できない場合' do
      it 'titleが空では保存できない' do
        @column.title = ''
        @column.valid?
        expect(@column.errors.full_messages).to include('タイトルを入力してください')
      end
      it 'textが空では保存できない' do
        @column.text = ''
        @column.valid?
        expect(@column.errors.full_messages).to include('テキストを入力してください')
      end
      it 'genre_idが空では保存できない' do
        @column.genre_id = nil
        @column.valid?
        expect(@column.errors.full_messages).to include('カテゴリーを入力してください')
      end
      # it 'genre_idが1では保存できない' do
      #  @column.genre_id = 1
      #  @column.valid?
      #  expect(@column.errors.full_messages).to include('Genre  を選択してください ')
      # end
      it '管理者が紐付いていないと保存できない' do
        @column.user_id = 0
        @column.valid?
        expect(@column.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end

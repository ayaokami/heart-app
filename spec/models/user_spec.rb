require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '必要な値を入力すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'water_restrictionは空でも登録できる' do
        @user.water_restriction = nil
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'nicknameが6文字以上では登録できない' do
        @user.nickname = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームは6文字以内で入力してください')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailに@が含まれなければ登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'last_name_kana が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（カナ）を入力してください')
      end
      it 'last_name_kanaが全角カタカナ以外では登録できない' do
        @user.last_name_kana = 'aあ亜0'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（カナ）は全角カタカナを使用してください')
      end
      it 'first_name_kana が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）を入力してください')
      end
      it 'first_name_kanaが全角カタカナ以外では登録できない' do
        @user.first_name_kana = 'aあ亜0'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は全角カタカナを使用してください')
      end
      it 'target_weightが空では登録できない' do
        @user.target_weight = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('目標体重を入力してください')
      end
      it 'target_weightが5文字以上では登録できない' do
        @user.target_weight = 1234.6
        @user.valid?
        expect(@user.errors.full_messages).to include('目標体重は5文字以内で入力してください')
      end
      it 'target_weightは数値でないと登録できない' do
        @user.target_weight = 'あ１０ア亜'
        @user.valid?
        expect(@user.errors.full_messages).to include('目標体重は数値で入力してください')
      end
      it 'ageが空では登録できない' do
        @user.age = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('年齢を入力してください')
      end
      it 'ageが3文字以上では登録できない' do
        @user.age = 1111
        @user.valid?
        expect(@user.errors.full_messages).to include('年齢は3文字以内で入力してください')
      end
      it 'ageは整数でないと登録できない' do
        @user.age = 1.1
        @user.valid?
        expect(@user.errors.full_messages).to include('年齢は整数で入力してください')
      end
      it 'water_restrictionが4文字以上では登録できない' do
        @user.water_restriction = 10_000
        @user.valid?
        expect(@user.errors.full_messages).to include('1日の水分制限量は4文字以内で入力してください')
      end
      it 'water_restrictionは整数でないと登録できない' do
        @user.water_restriction = 10.0
        @user.valid?
        expect(@user.errors.full_messages).to include('1日の水分制限量は整数で入力してください')
      end
    end
  end
end

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
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'nicknameが6文字以上では登録できない' do
        @user.nickname = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 6 characters)')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれなければ登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_name_kana が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaが全角カタカナ以外では登録できない' do
        @user.last_name_kana = 'aあ亜0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナを使用してください')
      end
      it 'first_name_kana が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaが全角カタカナ以外では登録できない' do
        @user.first_name_kana = 'aあ亜0'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナを使用してください')
      end
      it 'target_weightが空では登録できない' do
        @user.target_weight = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Target weight can't be blank")
      end
      it 'target_weightが5文字以上では登録できない' do
        @user.target_weight = 1234.6
        @user.valid?
        expect(@user.errors.full_messages).to include('Target weight is too long (maximum is 5 characters)')
      end
      it 'ageが空では登録できない' do
        @user.age = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Age can't be blank")
      end
      it 'ageが3文字以上では登録できない' do
        @user.age = 1111
        @user.valid?
        expect(@user.errors.full_messages).to include('Age is too long (maximum is 3 characters)')
      end
      it 'water_restrictionが4文字以上では登録できない' do
        @user.water_restriction = 10_000
        @user.valid?
        expect(@user.errors.full_messages).to include('Water restriction is too long (maximum is 4 characters)')
      end
    end
  end
end

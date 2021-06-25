require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nameが空だと保存できないこと' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空だと保存できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空だと保存できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では保存できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したnameが存在する場合は保存ができないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.name = @user.name
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Name has already been taken')
      end
      it '重複したemailが存在する場合は保存ができないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailが@を含まない場合は保存ができないこと' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では保存ができないこと' do
        @user.password = 'test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
    end
  end
end
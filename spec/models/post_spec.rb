require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '新規投稿' do
    before do
      @post = FactoryBot.build(:post)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること'do
        expect(@post).to be_valid
      end
      it '所要時間は空でも保存できること' do
        @post.time = ''
        expect(@post).to be_valid
      end
      it 'コース名は空でも保存できること' do
        @post.route_name = ''
        expect(@post).to be_valid
      end
      it 'コース詳細は空でも保存できること' do
        @post.route_detail = ''
        expect(@post).to be_valid
      end
      it '感想は空でも保存できること' do
        @post.comment = ''
        expect(@post).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '画像がついていないと保存ができないこと' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end
      it '山の名前が空だと保存ができないこと' do
        @post.name = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Name can't be blank")
      end
      it '地域の情報が空だと保存ができないこと' do
        @post.area_id = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Area can't be blank", 'Area is not a number')
      end
      it '地域の情報が1を選択していると保存ができないこと' do
        @post.area_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include('Area must be other than 1')
      end
      it '日程が空だと保存できないこと' do
        @post.hiking_date = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Hiking date can't be blank")
      end
      it 'ユーザーが紐づいていないと保存ができないこと' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end
    end
  end
end

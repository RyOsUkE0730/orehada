require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '投稿をする' do
    context '投稿ができる場合' do
      it 'すべての記入項目が存在していれば投稿できる' do
        expect(@item).to be_valid
      end
    end

    context '投稿ができない場合' do
      it 'タイトルが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '投稿内容が空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーが空では登録できない' do
        @item.genre_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end
    end
  end
end


require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do

    context '商品出品できる場合' do
      it "情報が正しく入力されている時" do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it "商品画像がない場合は登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空では登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が空では登録できない" do
        @item.exp = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Exp can't be blank")
      end
      it "カテゴリーの情報が空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "カテゴリーに「---」が選択されている場合は出品できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態についての情報が空では登録できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "商品の状態に「---」が選択されている場合は出品できない" do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "配送料の負担についての情報が空では登録できない" do
        @item.fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it "配送料の負担に「---」が選択されている場合は出品できない" do
        @item.fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it "発送元の地域についての情報が空では登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送元の地域に「---」が選択されている場合は出品できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数が空では登録できない" do
        @item.days_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it "発送までの日数に「---」が選択されている場合は出品できない" do
        @item.days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it "販売価格についての情報が空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が300以下では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "販売価格が9999999円以上では登録できない" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "販売価格は半角数字でないと登録できない" do
        @item.price = "３００００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end

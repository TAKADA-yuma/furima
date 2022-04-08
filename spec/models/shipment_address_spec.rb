require 'rails_helper'

RSpec.describe ShipmentAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @shipment_address = FactoryBot.build(:shipment_address, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it "情報が正しく入力されている場合購入できる" do
        expect(@shipment_address).to be_valid
      end
      it "建物名が空でも購入できる" do
        @shipment_address.building = ""
        expect(@shipment_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      it "郵便番号が空では購入できない" do
        @shipment_address.post_num = ""
        @shipment_address.valid?
        expect(@shipment_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it "郵便番号に-がないと購入できない" do
        @shipment_address.post_num = "1234567"
        @shipment_address.valid?
        expect(@shipment_address.errors.full_messages).to include("郵便番号にはハイフンを入力してください")
      end
      it "都道府県が空では購入できない" do
        @shipment_address.prefecture_id = ""
        @shipment_address.valid?
        expect(@shipment_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it "都道府県に「---」が選択されている場合は購入できない" do
        @shipment_address.prefecture_id = 0
        @shipment_address.valid?
        expect(@shipment_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it "市区町村が空では購入できない" do
        @shipment_address.city = ""
        @shipment_address.valid?
        expect(@shipment_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it "番地が空では購入できない" do
        @shipment_address.house_num = ""
        @shipment_address.valid?
        expect(@shipment_address.errors.full_messages).to include("番地を入力してください")
      end
      it "電話番号が空では購入できない" do
        @shipment_address.tel = ""
        @shipment_address.valid?
        expect(@shipment_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it "電話番号が12桁以上では購入できない" do
        @shipment_address.tel = "123456789000"
        @shipment_address.valid?
        expect(@shipment_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "電話番号が9桁以下では購入できない" do
        @shipment_address.tel = "123456789"
        @shipment_address.valid?
        expect(@shipment_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "電話番号に数字以外が含まれている場合は購入できない" do
      @shipment_address.tel = "abcdefghijkl"
        @shipment_address.valid?
        expect(@shipment_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "電話番号に全角が含まれている場合は購入できない" do
        @shipment_address.tel = "１２３４５６７８９０００"
          @shipment_address.valid?
          expect(@shipment_address.errors.full_messages).to include("電話番号は不正な値です")
        end
      it "userが紐付いていなければ購入できない" do
        @shipment_address.user_id = nil
        @shipment_address.valid?
        expect(@shipment_address.errors.full_messages).to include("Userを入力してください")
      end
      it "itemが紐付いていなければ購入できない" do
        @shipment_address.item_id = nil
        @shipment_address.valid?
        expect(@shipment_address.errors.full_messages).to include("Itemを入力してください")
      end
      it "tokenが空では登録できないこと" do
        @shipment_address.token = nil
        @shipment_address.valid?
        expect(@shipment_address.errors.full_messages).to include("正しいカード情報を入力してください")
      end
    end
  end
end

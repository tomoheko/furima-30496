require 'rails_helper'

RSpec.describe '商品出品機能', type: :system do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/fruits.png")
  end
  context '商品出品機能がうまくいくとき' do
    it "name, image, explanation, category_id, condition_id, prefecture_id, shipment_term_id, price, shipment_fee_idが存在すれば出品できる" do
      expect(@item).to be_valid
    end
  end

  context '商品出品機能がうまくいかないとき' do
    it "nameが空だと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "explanationが空では登録できない" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank") 
    end
    it "category_idが' --- 'の時、つまりidが1では登録できない" do
      @item.category_id = 1  
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1") 
    end
    it "condition_idが' --- 'の時、つまりidが1では登録できない" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it "prefecture_idが' --- 'の時、つまりidが1では登録できない" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "shipment_term_idが' --- 'の時、つまりidが1では登録できない" do
      @item.shipment_term_id = 1  
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment term must be other than 1")
    end
    it "shipment_fee_idが' --- 'の時、つまりidが1では登録できない" do
      @item.shipment_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment fee must be other than 1")
    end
    it "priceが空では登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが299円だと登録できない" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "priceが10000000円だと登録できない" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it "priceの入力が全角だと登録できない" do
      @item.price = "５０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
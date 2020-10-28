require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '寄付情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_order).to be_valid
    end
  
    it "tokenが空では登録できないこと" do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_codeが空だと保存できないこと' do
      @user_order.post_code  = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
    end
    it 'post_codeに"-"が入っていないと保存できないこと' do
      @user_order.post_code = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it "prefecture_idが' --- 'の時、つまりidが1では登録できない" do
      @user_order.prefecture_id = 1
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end
    it 'home_numberが空だと保存できないこと' do
      @user_order.home_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Home number can't be blank")
    end
    it 'buildingは空でも保存できること' do
      @user_order.building = nil
      expect(@user_order).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid. Input half-width characters.")
    end
    it '電話番号にはハイフンは不要で、11桁以内であること' do
      @user_order.phone_number = '090-1234-56789'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
  end
end
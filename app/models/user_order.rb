class UserOrder
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :building, :home_number, :phone_number, :item_id,:user_id, :token
  validates :token, presence: true

  with_options presence: true do
    validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :home_number
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end


  def save
    order = Order.create(item_id: item_id, user_id: user_id) # 住所の情報を保存
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, home_number: home_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end
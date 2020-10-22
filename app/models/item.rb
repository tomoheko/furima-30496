class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipment_fee
  belongs_to_active_hash :shipment_term

  #空の投稿を保存できないようにする
with_options presence: true do
  validates :name
  validates :explanation
  validates :catrgory
  validates :condition
  validates :prefecture
  validates :shipment_term
  validates :price
  validates :shipment_fee
end

##ジャンルの選択が「--」の時は保存できないようにする
with_options numericality: { other_than: 1 }  do
  validates :catrgory_id
  validates :condition_id
  validates :prefecture_id
  validates :shipment_term_id
  validates :shipment_fee_id
end

  #アソシエーション
  has_one_attached :image
  belongs_to :user

end

class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :post_cord, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/}

  with_options presence: true do
    validates :city
    validates :name
    validates :home_number
    validates :phone_number
  end

  with_options numericality: { other_than: 1 }  do
    validates :prefecture_id
  end
  

  belongs_to :order
end

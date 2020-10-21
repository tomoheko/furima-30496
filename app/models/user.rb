class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname                
    validates :birthday
  end

  # 半角英数混合パスワード設定
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: 'Passwordis invalid. Input half-width characters.' } 
  
  # 全角カナ
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } do
    validates :family_name_kana
    validates :first_name_kana
  end

  # 全角かな/カナ漢字の区別
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name_kanji
    validates :family_name_kanji
  end
end
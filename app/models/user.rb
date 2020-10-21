class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :nickname,                presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: 'Passwordis invalid. Input half-width characters.' } # 半角英数混合設定
  # validates :password, format: { with: /\A[a-z0-9]+\z/i, message: 'Passwordis invalid. Input half-width characters.' } # 半角英数混合設定
  # validates :email,                   presence: true
  # validates :password,                presence: true
  # validates :password_confirmation,   presence: true
  validates :family_name_kanji,       presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'Last name Full-width characters' }
  validates :first_name_kanji,        presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'Family name Full-width characters' }
  validates :family_name_kana,        presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Last name kana Full-width katakana characters' }
  validates :first_name_kana,         presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Family name kana Full-width katakana characters' }
  validates :birthday,                presence: true

  # 全角かな/カナ漢字の区別
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name_kanji
    validates :family_name_kanji
    validates :first_name_kana
    validates :family_name_kana
  end

  # 半角英数混合設定
  # PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  # validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  # VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
  # validates :password, format: { with: VALID_PASSWORD_REGEX,
  #           message: "は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります"}
  
  
end
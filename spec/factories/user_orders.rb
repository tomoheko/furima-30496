FactoryBot.define do
  factory :user_order do
    token        {"tok_abcdefghijk00000000000000000"}
    post_code    { '123-4567' }
    prefecture_id { '28' }
    city         { 'Hirakata' }
    home_number  { '1-2-3' }
    building     { '森ビル' }
    phone_number { '09012345678' }
  end
end

# テスト要件
# 配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること
# 郵便番号にはハイフンが必要であること（123-4567となる）
# 電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）
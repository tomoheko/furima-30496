FactoryBot.define do
  factory :item do
    association :user
    name             {"フルーツ"}
    explanation      {"フルーツ盛り合わせ"}
    category_id      {3}
    condition_id     {3}
    prefecture_id    {3}
    shipment_term_id {3}
    price            {3000}
    shipment_fee_id  {3}
  end
end

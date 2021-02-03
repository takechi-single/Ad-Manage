FactoryBot.define do
  factory :manage do
    sale_date { '2021-02-01' }
    profit { '50000' }

    association :user
   association :item
  end
end

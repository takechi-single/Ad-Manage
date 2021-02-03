FactoryBot.define do
  factory :plan do
   target_id { '男女35歳～49歳' } 
   media_id { '折込' } 
   how_much { '460000' } 
   association :user
   association :item
  end
end

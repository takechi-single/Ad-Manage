FactoryBot.define do
  factory :plan do
    out_date {'2021-01-01' }
    where {'東京都中野区' }
   target_id { '男女35歳～49歳' } 
   media_id { '折込' } 
   how_much { '460000' } 
   user_id { 1 }
   item_id { 1 }
   
   association :item
  end
end

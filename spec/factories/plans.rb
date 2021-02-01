FactoryBot.define do
  factory :plan do
   when { '2021-01-01' }
   target_id { '男女35歳～49歳' } 
   media_id { '折込' } 
   how_much { '460000' } 
  end
end

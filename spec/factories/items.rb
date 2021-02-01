FactoryBot.define do
  factory :item do
    image { 'image/png' }
    name { 'リンゴジュース' }
    taxt { '長野県産りんごを使用し、甘酸っぱさが魅力' }
    price { '650' }
    relese_date {'2021-01-01' }


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

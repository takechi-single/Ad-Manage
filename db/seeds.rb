# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.create!(
    #name: '山本太郎',
    #email:  'yamamoto1@com',
    #password: 'yamamoto1111',
    #password_confirmation: 'yamamoto1111'
#)

#Item.create(
  #name: 'リンゴジュース',
  #text: '長野県産りんごを使用し、甘酸っぱさが魅力',
  #price: '650',
  #relese_date: '2021-01-01',
  #user_id: '99',
  #image: attach(io: File.open("./db/images/test.jpg")
#)

Plan.create(out_date: '2021-01-01', where: '東京都中野区', target_id: '男女35歳～49歳', media_id: '折込', how_much: '460000', user_id: '99', item_id: '99')

Manage.create(sale_date: '2021-02-01', profit: '50000', user_id: '1', item_id: '1')

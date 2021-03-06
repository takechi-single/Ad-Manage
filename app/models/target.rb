class Target < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '男女4歳～12歳(幼年層)' },
    { id: 3, name: '男女13歳～19歳(若年層)' },
    { id: 4, name: '男女20歳～34歳' },
    { id: 5, name: '男女35歳～49歳' },
    { id: 6, name: '男女50歳以上' },
    { id: 7, name: '20歳～34歳の女性' },
    { id: 8, name: '35歳～49歳の女性' },
    { id: 9, name: '50歳以上の女性' },
    { id: 10, name: '20歳～34歳の男性' },
    { id: 11, name: '35歳～49歳歳の男性' },
    { id: 12, name: '50歳以上の男性' },
    { id: 13, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :plan
end

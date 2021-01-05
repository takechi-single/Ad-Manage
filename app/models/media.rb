class Media < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'インターネット' },
    { id: 3, name: '地上波テレビ' },
    { id: 4, name: '衛生メデイア関連' },
    { id: 5, name: '新聞' },
    { id: 6, name: '雑誌' },
    { id: 7, name: 'ラジオ' },
    { id: 8, name: '折込' },
    { id: 9, name: 'ポスティング' },
    { id: 10, name: '展示・映像etc' },
    { id: 11, name: '屋外広告' },
    { id: 12, name: 'フリーペーパー・マガジンetc' },
    { id: 13, name: '店内POP' },
    { id: 14, name: '交通広告' },
    { id: 15, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :plan
end

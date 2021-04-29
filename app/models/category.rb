class Category < ActiveHash::Base
  self.data = [
   { id: 1, name: '--' },
   { id: 2, name: 'レディース' },
   { id: 3, name: 'メンズ' },
   { id: 4, name: 'ベビー' },
   { id: 5, name: 'インテリー 住まい 小物' },
   { id: 6, name: '本' },
   { id: 7, name: 'おもちゃ' },
   { id: 8, name: '家電' },
   { id: 9, name: 'ハンドメイド' },
   { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
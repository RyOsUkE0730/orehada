class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '乾燥肌' },
    { id: 2, name: '油っぽい' },
    { id: 3, name: 'ニキビ' },
    { id: 4, name: 'ワンランク上を目指す人' },
  ]

  include ActiveHash::Associations
  has_many :items
  end
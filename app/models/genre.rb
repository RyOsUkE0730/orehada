class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: 'どの悩み近い？' },
    { id: 1, name: '乾燥肌' },
    { id: 2, name: '油っぽい' },
    { id: 3, name: 'ニキビ' },
    { id: 4, name: 'ワンランク上の肌を目指したい人へ' },
  ]

  include ActiveHash::Associations
  has_many :items
  end
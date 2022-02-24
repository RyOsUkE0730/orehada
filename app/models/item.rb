class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  has_one_attached :image
  belongs_to :genre
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :explanation
  end

  validates :genre_id, numericality: { other_than: 0, message: "can't be blank" } 
end

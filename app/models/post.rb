class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  with_options presence: true do
    validates :image, :name, :hiking_date
    validates :area_id, numericality: { other_than: 1 }
  end

end

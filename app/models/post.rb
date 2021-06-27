class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image, :name, :hiking_date
    validates :area_id, numericality: { other_than: 0 }
  end

end

class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :condition
  belongs_to :user
  has_many :line_items

  geocoded_by :address
  after_validation :geocode

  has_attached_file :image, styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end

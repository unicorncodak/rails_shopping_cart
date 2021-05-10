class Product < ApplicationRecord
    #has_many :ProductImage, dependent: :destroy
    belongs_to :Category, optional: true
    has_one_attached :image, :dependent => :destroy
    has_many :line_items, dependent: :destroy
end

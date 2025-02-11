class Product < ApplicationRecord
  after_update_commit -> { broadcast_replace_to "products", partial: "products/product", locals: { product: self } }

  has_one_attached :image
  validates :name, :price, :quantity, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

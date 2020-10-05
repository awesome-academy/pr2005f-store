class Product < ApplicationRecord
	has_many :order_details
	has_many :product_details
	has_many :comments, dependent: :destroy
	has_many :product_photos
	accepts_nested_attributes_for :product_photos, allow_destroy: true, reject_if: proc { |attributes| attributes['photo'].blank? }
	
end

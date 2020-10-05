class ProductsController < ApplicationController
	before_action :find_product, only: :show

	def index
		@products = Product.all
	end	
	def show
		@supports = Supports::Product.new @product
		if current_user.present?
			@comment = current_user.comments.build
		end

		@comments = @product.comments.page(params[:page]).per 20
	end
	
	private
	def find_product
		@product = Product.find_by id: params[:id]
		if @product.nil?
			redirect_to root_url
		end
	end			
end

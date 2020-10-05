class Supports::Product
  attr_reader :product, :products

  def initialize product
    @product = product
  end

  def products
    @products ||= Product.all
  end

  def comment
    @comment = Comment.new
  end

  def comments_tree
    @comments = @product.comments
  end
end

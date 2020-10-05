class CommentsController < ApplicationController
	before_action :find_comment, only: [:show, :edit, :update, :destroy]
	# before_action :authenticate_user!, only: [:new, :create]
	def index

	end
	def show
	end
	def new
		@comment = current_user.comments.build
	end	
	def create

		if params[:comment][:parent_id].to_i > 0
	      parent = Comment.find_by id: params[:comment].delete(:parent_id)
	      @comment = parent.children.build comment_params
	    else
	      @product = Product.find_by id: comment_params[:product_id]
		  @comment = current_user.comments.build(comment_params)
	    end

		if @comment.save! 
			redirect_back(fallback_location: root_url)
	 	  # render json: {   
	    #     comment_data: @comment
	    #   }, status: :ok  
		end 
		
	end

	def edit
	end

	def update
	end

	def destroy
		@comment.descendants.each do |comment_des|
     		comment_des.destroy
  		end
	    @comment.destroy
	    # redirect_to @comment.product
	end

	private 
	def comment_params
		params.require(:comment).permit(:content, :user_id, :product_id, :parent_id)
	end		
	def find_comment
		@comment = Comment.find_by id: params[:id]
		if @comment.nil?
			redirect_to root_url
		end
	end		

end

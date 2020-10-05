class CommentsController < ApplicationController
	before_action :find_comment, only: [:show, :edit, :update, :destroy]
	# before_action :authenticate_user!, only: [:new, :create]
	skip_before_action :verify_authenticity_token, only: [:create,:update]
	def index

	end
	def show
	
	end
	def new
		@comment = Comment.new
	end	
	def create
		@comment = current_user.comments.build( product_id: params[:product_id], parent_id: params[:parent_id], content: params[:content], id: params[:id])
		if @comment.save! 
	 	  render json: {   
	        data_comment: render_to_string(@comment),
	        count_comment: @comment.product.comments.count
	      }, status: :ok  
	    else 
	   		flash[:danger] = "error"
		end 
		
	end

	def edit
	end

	def update
	
		@comment.update!(product_id: params[:product_id], content: params[:content], id: params[:id])
		render json: {   
	        update_data_comment: render_to_string(@comment)
	      }, status: :ok  
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
		params.require(:comment).permit(:content, :user_id, :product_id, parent_id: params[:comment])
	end		
	def find_comment
		@comment = Comment.find_by id: params[:id]
		if @comment.nil?
			redirect_to root_url
		end
	end		

end

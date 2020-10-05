class SubCommentsController < ApplicationController
	before_action :find_sub_comment, only: [:destroy]
	skip_before_action :verify_authenticity_token, only: :create
	def new
		@sub_comment = SubComment.new
		@comment = Comment.find_by id: params[:comment_id]
	end	
	def create
			@sub_comment = current_user.sub_comments.build( comment_id: params[:comment_id], content: params[:content])
	
		if @sub_comment.save!
			render json: {
				 data_comment_subcomment: render_to_string(@sub_comment)
			}, status: :ok
			
			
		end		
	end	

	def destroy
		@sub_comment.destroy
	end
	private 
	def sub_comment_params
		params.require(:sub_comment).permit(:content, :user_id, :comment_id)	
	end	
	def find_sub_comment
		@sub_comment = SubComment.find_by id: params[:id]
		if @sub_comment.nil?
			redirect_to root_url
		end	
	end	
	
end

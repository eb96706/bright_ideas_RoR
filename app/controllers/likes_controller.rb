class LikesController < ApplicationController
	def create
		new_like = Like.new(like_params)
		new_like.user = User.find(session[:user_id])
		if new_like.save
			redirect_to '/posts'
		else
			flash[:error_like] = new_like.errors.full_messages
			redirect_to '/posts'
		end
	end

	private
	def like_params
	 	params.permit(:post_id, :user_id)
	end
end

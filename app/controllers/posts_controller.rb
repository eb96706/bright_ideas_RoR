class PostsController < ApplicationController
	
  def index
  	postsUnsorted = Post.all
    @posts = postsUnsorted.sort_by { |post| post.likes.count }
  	@user = User.find(session[:user_id])
  end
  #another variation of likes count  is it working?
  # def index
  #   @posts = Post.find(:all).sort {|x,y| y.likes.count <=> x.likes.count}
  #   @post=Post.new
  # end

  def create
  	new_post = Post.new(post_params)
  	new_post.user = User.find(session[:user_id])
  	if new_post.save
  		redirect_to '/posts' #where to redirect
  	else
  		flash[:error] = 'Cannot be blank'
  		redirect_to '/posts'
  	end
  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
  	redirect_to '/posts'
  end

  def show
  	@post = Post.find(params[:id])
  end

  private
  def post_params
  	params.require(:post).permit(:post)
  end

end

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.assign_attributes(post_params)
    if @post.save
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if current_user.id == @post.owner.id
      @post.destroy
      redirect_to posts_path
    else
      @errors = ["You are not the owner of this Post"]
      render "index"
    end
  end



private
def post_params
  params.require(:post).permit(:title, :url).merge(owner:current_user)
end

end

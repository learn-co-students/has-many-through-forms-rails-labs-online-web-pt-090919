class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    # Instantiate category so we can get a text field to fill in
    #3.times do # ->If you want 3 text fields (3 categories)
      @post.categories.build(name: "Sample Category")
    #end
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end

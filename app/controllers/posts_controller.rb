class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    logger.info "show"
  end

  def new

  end

  def create
    # render plain: params[:post].inspect
    @post = Post.new(post_params)
    if(@post.save)
      redirect_to @post
    else
      render 'new'
    end

  end

  def edit
    @post = Post.find(params[:id])
  end



  def update
    @post = Post.find(params[:id])
    if(@post.update(post_params))
      redirect_to @post
    else
      render 'edit'
    end

  end
  def destroy
    logger.info "destroy"
    Post.find(params[:id]).destroy()

    redirect_to posts_path

  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end

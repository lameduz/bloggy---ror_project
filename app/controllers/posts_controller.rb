class PostsController < ApplicationController
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
      @posts = @posts.order("title").page(params[:page]).per(8)
    elsif params[:q]
      @posts = Post.search(params[:q]).page(params[:page]).per(8)
    else
      #@posts = Post.all
      @posts = Post.order("title").page(params[:page]).per(8)
    end
  end


  def new
    @post = Post.new
  end

  def create

    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      redirect_to edit_post_path
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.liked_by current_user

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render layout: false }
    end
  end

  def dislike
    @post = Post.find(params[:id])
    @post.downvote_from current_user

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render layout: false }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to profile_path(@post.user.profile)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :avatar, :tag_list)
  end
end

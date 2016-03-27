class LikesController < ApplicationController
  def create
    @post = Post.find(params)
    abort @post.inspect
  end

  def destroy

  end
end

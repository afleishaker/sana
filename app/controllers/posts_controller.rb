class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    def show_post
        @post = Post.find(params[:id])
        @user = User.find(@post.user_id)
    end
end

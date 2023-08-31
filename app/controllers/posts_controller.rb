class PostsController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = session[:user_id]

        if @post.save
          flash[:alert] = "Post created"
          redirect_to "/dashboards/index"
        else
          flash[:alert] = "Couldn't save the post"
          render :new, status: :unprocessable_entity
        end
    end

    def show
    end

    def edit
      @post = Post.find_by_id(params[:id])
    end

    def update
      @post = Post.find_by_id(params[:id])
      if session[:user_id] == @post.user_id
        if @post.update(post_params)
          flash[:alert] = "Post updated"
          redirect_to "/dashboards/index"
        else
          flash[:alert] = "Couldn't update the post"
          render :new, status: :unprocessable_entity
        end
      else
        flash[:alert] = "Logged user is not the owner of the post"
        redirect_to "/dashboards/index"
      end
    end
    
    private

    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
  end
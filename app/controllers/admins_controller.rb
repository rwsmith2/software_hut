class AdminsController < ApplicationController

    skip_authorization_check
  
    def index
      @current_nav_identifier = :index
    end

    def new
      @task = Task.new
    end

    def create
      @task = Task.new(admin_id: current_user)
  
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end

    def update
      @Task.author = current_user
      
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @task.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end

    def search
    end
  
    def search_result
      #@posts = Post.where("title = ?", params[:search][:title]).where("private_post = 'f'")
      #@posts = Post.where("title = '#{params[:search][:title]}'").where("private_post = 'f'")
    end
  end
  
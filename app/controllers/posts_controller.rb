class PostsController < ApplicationController
  before_action :authenticate
  before_action :find_post, only: %i[edit update destroy]

  def index
    @form = CreatePostForm.new
    posts
  end

  def create
    temperature = WeatherFinder.new(params[:create_post_form][:city_name]).call
    @form = CreatePostForm.new(post_params.merge(temperature: temperature))

    if @form.save
      redirect_to posts_path, notice: 'Post successfully created'
    else
      posts
      render action: :index, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @post.update(edit_params)
      redirect_to posts_path, notice: 'Post successfully updated'
    else
      posts
      render action: :index, status: :unprocessable_entity
    end
  end

  def destroy
    respond_to do |format|
      if @post.destroy
        format.html { redirect_to posts_path, notice: 'User was successfully destroy.' }
        format.js
      else
        posts
        format.html { render action: :index }
      end
    end
  end

  private

  def post_params
    params.require(:create_post_form).permit(:note, :city_name).merge(user_id: current_user.id)
  end

  def edit_params
    params.require(:post).permit(:note)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def posts
    @posts = current_user.posts.includes(:city, city: :weather).order(created_at: :desc).page(params[:page]).per(5)
  end
end

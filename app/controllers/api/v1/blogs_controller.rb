module Api
  module V1
class BlogsController < ApplicationController
  
  before_action :set_blog, only: %i[ show update destroy ]
  before_action :authorized

  # GET /blogs
  def index
    blogs = Blog.all

    render json: BlogSerializer.new(blogs, options).serialized_json
  end

  # GET /blogs/1
  def show
    blog = Blog.find(params[:id])
    render json: BlogSerializer.new(blog, options).serialized_json
  end

  # POST /blogs
  def create
    blog = Blog.new(blog_params)
    if blog.save
      render json: BlogSerializer.new(blog).serialized_json
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blogs/1
  def update

    blog = Blog.find(params[:id])

    if blog.update(blog_params)
      render json: BlogSerializer.new(blog, options).serialized_json
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blogs/1
  def destroy
    blog = Blog.find(params[:id])

    if blog.destroy
      head :no_content, status: :ok
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :user_id)
    end
    def options
      @options ||= { include: %i[paragraphs images] }
    end
end
end
end
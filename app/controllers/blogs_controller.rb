class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show update destroy ]
  before_action :authorized

  # GET /blogs
  def index
    @blogs = Blog.all

    render json: @blogs
  end

  # GET /blogs/1
  def show
    @blog = Blog.find(params[:id])
    render json: @blog
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)
    @blog.user = @user.id

    if @blog.save
      render json: @blog, status: :created, location: @blog
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blogs/1
  def update
    if @blog.update(blog_params)
      @blog.user = @user.id
      render json: @blog
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
    if @blog.destroy
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
end

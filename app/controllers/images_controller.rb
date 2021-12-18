class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show update destroy ]

  # GET /images
  def index
    @images = Image.all

    render json: @images
  end

  # GET /images/1
  def show
    @image = Image.find(params[:id])
    render json: @image
  end

  # POST /images
  def create
    @image = Image.new(image_params)
    @image.blog = @blog.id
    if @image.save
      render json: @image, status: :created, location: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      @image.blog = @blog.id
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
    if @image.destroy
      head :no_content, status: :ok
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:heading, :content, :subtext, :blog_id)
    end
end

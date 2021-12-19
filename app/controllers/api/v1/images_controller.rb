module Api
  module V1
class ImagesController < ApplicationController
  # before_action :set_image, only: %i[ show create update destroy ]

  # GET /images
  def index
    images = Image.all

    render json: ImagesSerializer.new(images)
  end

  # GET /images/1
  def show
    image = Image.find(params[:id])
    render json: ImagesSerializer.new(image).serialized_json
  end

  # POST /images
  def create
    image = Image.new(image_params)
    if image.save
      render json: ImagesSerializer.new(image).serialized_json
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /images/1
  def update

    image = Image.find(params[:id])

    if image.update(image_params)
      render json: ImagesSerializer.new(image).serialized_json
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  def destroy

    image = Image.find(params[:id])

    if image.destroy
      head :no_content, status: :ok
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      image = Image.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:heading, :content, :subtext, :order, :blog_id)
    end
end
end
end
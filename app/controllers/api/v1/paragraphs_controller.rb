module Api
  module V1
class ParagraphsController < ApplicationController

  before_action :set_paragraph, only: %i[ show update destroy ]

  # GET /paragraphs
  def index
    paragraphs = Paragraph.all

    render json: ParagraphsSerializer.new(paragraphs).serialized_json
  end

  # GET /paragraphs/1
  def show
    paragraph = Paragraph.find(params[:id])
    render json: ParagraphsSerializer.new(paragraph).serialized_json
  end

  # POST /paragraphs
  def create
    paragraph = Paragraph.new(paragraph_params)

    if paragraph.save
      render json: ParagraphsSerializer.new(paragraph).serialized_json
    else
      render json: @paragraph.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /paragraphs/1
  def update

    paragraph = Paragraph.find(params[:id])

    if paragraph.update(paragraph_params)
      render json: ParagraphsSerializer.new(paragraph).serialized_json
    else
      render json: @paragraph.errors, status: :unprocessable_entity
    end
  end

  # DELETE /paragraphs/1
  def destroy
    
    paragraph = Paragraph.find(params[:id])

    if paragraph.destroy
      head :no_content, status: :ok
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paragraph
      @paragraph = Paragraph.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paragraph_params
      params.require(:paragraph).permit(:heading, :content, :subtext, :order, :blog_id)
    end
end
end
end
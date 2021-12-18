class ParagraphsController < ApplicationController
  before_action :set_paragraph, only: %i[ show update destroy ]

  # GET /paragraphs
  def index
    @paragraphs = Paragraph.all

    render json: @paragraphs
  end

  # GET /paragraphs/1
  def show
    @paragraph = Paragraph.find(params[:id])
    render json: @paragraph
  end

  # POST /paragraphs
  def create
    @paragraph = Paragraph.new(paragraph_params)
    @paragraph.blog = @blog.id
    if @paragraph.save
      render json: @paragraph, status: :created, location: @paragraph
    else
      render json: @paragraph.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /paragraphs/1
  def update
    if @paragraph.update(paragraph_params)
      @paragraph.blog = @blog.id
      render json: @paragraph
    else
      render json: @paragraph.errors, status: :unprocessable_entity
    end
  end

  # DELETE /paragraphs/1
  def destroy
    @paragraph.destroy
    if @paragraph.destroy
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
      params.require(:paragraph).permit(:heading, :content, :subtext. :blog_id)
    end
end

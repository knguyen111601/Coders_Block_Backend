require "test_helper"

class ParagraphsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paragraph = paragraphs(:one)
  end

  test "should get index" do
    get paragraphs_url, as: :json
    assert_response :success
  end

  test "should create paragraph" do
    assert_difference("Paragraph.count") do
      post paragraphs_url, params: { paragraph: { content: @paragraph.content, heading: @paragraph.heading, subtext: @paragraph.subtext } }, as: :json
    end

    assert_response :created
  end

  test "should show paragraph" do
    get paragraph_url(@paragraph), as: :json
    assert_response :success
  end

  test "should update paragraph" do
    patch paragraph_url(@paragraph), params: { paragraph: { content: @paragraph.content, heading: @paragraph.heading, subtext: @paragraph.subtext } }, as: :json
    assert_response :success
  end

  test "should destroy paragraph" do
    assert_difference("Paragraph.count", -1) do
      delete paragraph_url(@paragraph), as: :json
    end

    assert_response :no_content
  end
end

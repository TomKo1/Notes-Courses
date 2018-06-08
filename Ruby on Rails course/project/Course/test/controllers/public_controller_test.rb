require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_index_url
    assert_response :success
  end

  test "should get articles" do
    get public_articles_url
    assert_response :success
  end

  test "should get galleries" do
    get public_galleries_url
    assert_response :success
  end

  test "should get categories" do
    get public_categories_url
    assert_response :success
  end

  test "should get news" do
    get public_news_url
    assert_response :success
  end

  test "should get page" do
    get public_page_url
    assert_response :success
  end

end

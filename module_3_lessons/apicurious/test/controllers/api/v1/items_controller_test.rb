require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#index" do
    #the # makes it so we're testing the instance method.
    get :index, format: :json

    items = JSON.parse(response.body)
    first_item = items.first

    assert_response :success
    assert_equal 2, items.count
    assert_equal 1, first_item["id"]
    assert_equal "Dog", first_item["name"]
    assert_equal "This is a dog.", first_item["description"]
  end

  test "#show" do
    get :show, { id: 1 , format: :json }

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal "Dog", item["name"]
    assert_equal "This is a dog.", item["description"]
  end

  test "#create" do
    assert_difference("Item.count", 1) do
      post :create, format: :json, item: { name: "Cow", description: "This is a cow" }
    end

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal "Cow", item["name"]
    assert_equal "This is a cow", item["description"]
  end

  test "#update" do
    assert_difference("Item.count", 0) do
      patch :update, format: :json, id: "1", item: { name: "Doggies", description: "These are my doggies." }
    end

    item = Item.find(1)

    assert_response :success

    assert_equal "Doggies", item.name
    assert_equal "These are my doggies.", item.description
  end

  test "#destroy" do
    assert_difference("Item.count", -1) do
      delete :destroy, format: :json, id: "1"
    end

    assert_response :success
  end
end

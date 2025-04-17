require "application_system_test_case"

class ProductAttributesTest < ApplicationSystemTestCase
  setup do
    @product_attribute = product_attributes(:one)
  end

  test "visiting the index" do
    visit product_attributes_url
    assert_selector "h1", text: "Product attributes"
  end

  test "should create product attribute" do
    visit product_attributes_url
    click_on "New product attribute"

    fill_in "Attribute name", with: @product_attribute.attribute_name
    fill_in "Attribute value", with: @product_attribute.attribute_value
    fill_in "Product", with: @product_attribute.product_id
    click_on "Create Product attribute"

    assert_text "Product attribute was successfully created"
    click_on "Back"
  end

  test "should update Product attribute" do
    visit product_attribute_url(@product_attribute)
    click_on "Edit this product attribute", match: :first

    fill_in "Attribute name", with: @product_attribute.attribute_name
    fill_in "Attribute value", with: @product_attribute.attribute_value
    fill_in "Product", with: @product_attribute.product_id
    click_on "Update Product attribute"

    assert_text "Product attribute was successfully updated"
    click_on "Back"
  end

  test "should destroy Product attribute" do
    visit product_attribute_url(@product_attribute)
    accept_confirm { click_on "Destroy this product attribute", match: :first }

    assert_text "Product attribute was successfully destroyed"
  end
end

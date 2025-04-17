require "application_system_test_case"

class InventoryTransactionsTest < ApplicationSystemTestCase
  setup do
    @inventory_transaction = inventory_transactions(:one)
  end

  test "visiting the index" do
    visit inventory_transactions_url
    assert_selector "h1", text: "Inventory transactions"
  end

  test "should create inventory transaction" do
    visit inventory_transactions_url
    click_on "New inventory transaction"

    fill_in "Notes", with: @inventory_transaction.notes
    fill_in "Product", with: @inventory_transaction.product_id
    fill_in "Quantity change", with: @inventory_transaction.quantity_change
    fill_in "Transaction type", with: @inventory_transaction.transaction_type
    click_on "Create Inventory transaction"

    assert_text "Inventory transaction was successfully created"
    click_on "Back"
  end

  test "should update Inventory transaction" do
    visit inventory_transaction_url(@inventory_transaction)
    click_on "Edit this inventory transaction", match: :first

    fill_in "Notes", with: @inventory_transaction.notes
    fill_in "Product", with: @inventory_transaction.product_id
    fill_in "Quantity change", with: @inventory_transaction.quantity_change
    fill_in "Transaction type", with: @inventory_transaction.transaction_type
    click_on "Update Inventory transaction"

    assert_text "Inventory transaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Inventory transaction" do
    visit inventory_transaction_url(@inventory_transaction)
    accept_confirm { click_on "Destroy this inventory transaction", match: :first }

    assert_text "Inventory transaction was successfully destroyed"
  end
end

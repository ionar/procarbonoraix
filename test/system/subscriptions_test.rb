require "application_system_test_case"

class SubscriptionsTest < ApplicationSystemTestCase
  setup do
    @subscription = subscriptions(:one)
  end

  test "visiting the index" do
    visit subscriptions_url
    assert_selector "h1", text: "Subscriptions"
  end

  test "should create subscription" do
    visit subscriptions_url
    click_on "New subscription"

    check "Agree" if @subscription.agree
    fill_in "City", with: @subscription.city
    fill_in "Email", with: @subscription.email
    fill_in "Name", with: @subscription.name
    fill_in "Phone", with: @subscription.phone
    fill_in "Profile", with: @subscription.profile
    fill_in "Province", with: @subscription.province
    click_on "Create Subscription"

    assert_text "Subscription was successfully created"
    click_on "Back"
  end

  test "should update Subscription" do
    visit subscription_url(@subscription)
    click_on "Edit this subscription", match: :first

    check "Agree" if @subscription.agree
    fill_in "City", with: @subscription.city
    fill_in "Email", with: @subscription.email
    fill_in "Name", with: @subscription.name
    fill_in "Phone", with: @subscription.phone
    fill_in "Profile", with: @subscription.profile
    fill_in "Province", with: @subscription.province
    click_on "Update Subscription"

    assert_text "Subscription was successfully updated"
    click_on "Back"
  end

  test "should destroy Subscription" do
    visit subscription_url(@subscription)
    click_on "Destroy this subscription", match: :first

    assert_text "Subscription was successfully destroyed"
  end
end

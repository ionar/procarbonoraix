require "application_system_test_case"

class ResgatesTest < ApplicationSystemTestCase
  setup do
    @resgate = resgates(:one)
  end

  test "visiting the index" do
    visit resgates_url
    assert_selector "h1", text: "Resgates"
  end

  test "should create resgate" do
    visit resgates_url
    click_on "New resgate"

    check "Agree" if @resgate.agree
    fill_in "Chave", with: @resgate.chave
    fill_in "Cpfcnpj", with: @resgate.cpfcnpj
    fill_in "Email", with: @resgate.email
    fill_in "Nome", with: @resgate.nome
    fill_in "Phone", with: @resgate.phone
    check "Privacidade" if @resgate.privacidade
    click_on "Create Resgate"

    assert_text "Resgate was successfully created"
    click_on "Back"
  end

  test "should update Resgate" do
    visit resgate_url(@resgate)
    click_on "Edit this resgate", match: :first

    check "Agree" if @resgate.agree
    fill_in "Chave", with: @resgate.chave
    fill_in "Cpfcnpj", with: @resgate.cpfcnpj
    fill_in "Email", with: @resgate.email
    fill_in "Nome", with: @resgate.nome
    fill_in "Phone", with: @resgate.phone
    check "Privacidade" if @resgate.privacidade
    click_on "Update Resgate"

    assert_text "Resgate was successfully updated"
    click_on "Back"
  end

  test "should destroy Resgate" do
    visit resgate_url(@resgate)
    click_on "Destroy this resgate", match: :first

    assert_text "Resgate was successfully destroyed"
  end
end

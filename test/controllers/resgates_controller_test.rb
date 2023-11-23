require "test_helper"

class ResgatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resgate = resgates(:one)
  end

  test "should get index" do
    get resgates_url
    assert_response :success
  end

  test "should get new" do
    get new_resgate_url
    assert_response :success
  end

  test "should create resgate" do
    assert_difference("Resgate.count") do
      post resgates_url, params: { resgate: { agree: @resgate.agree, chave: @resgate.chave, cpfcnpj: @resgate.cpfcnpj, email: @resgate.email, nome: @resgate.nome, phone: @resgate.phone, privacidade: @resgate.privacidade } }
    end

    assert_redirected_to resgate_url(Resgate.last)
  end

  test "should show resgate" do
    get resgate_url(@resgate)
    assert_response :success
  end

  test "should get edit" do
    get edit_resgate_url(@resgate)
    assert_response :success
  end

  test "should update resgate" do
    patch resgate_url(@resgate), params: { resgate: { agree: @resgate.agree, chave: @resgate.chave, cpfcnpj: @resgate.cpfcnpj, email: @resgate.email, nome: @resgate.nome, phone: @resgate.phone, privacidade: @resgate.privacidade } }
    assert_redirected_to resgate_url(@resgate)
  end

  test "should destroy resgate" do
    assert_difference("Resgate.count", -1) do
      delete resgate_url(@resgate)
    end

    assert_redirected_to resgates_url
  end
end

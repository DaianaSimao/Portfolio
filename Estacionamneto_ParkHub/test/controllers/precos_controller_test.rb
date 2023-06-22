require "test_helper"

class PrecosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @preco = precos(:one)
  end

  test "should get index" do
    get precos_url
    assert_response :success
  end

  test "should get new" do
    get new_preco_url
    assert_response :success
  end

  test "should create preco" do
    assert_difference("Preco.count") do
      post precos_url, params: { preco: { preco_hora: @preco.preco_hora, veiculo_id: @preco.veiculo_id } }
    end

    assert_redirected_to preco_url(Preco.last)
  end

  test "should show preco" do
    get preco_url(@preco)
    assert_response :success
  end

  test "should get edit" do
    get edit_preco_url(@preco)
    assert_response :success
  end

  test "should update preco" do
    patch preco_url(@preco), params: { preco: { preco_hora: @preco.preco_hora, veiculo_id: @preco.veiculo_id } }
    assert_redirected_to preco_url(@preco)
  end

  test "should destroy preco" do
    assert_difference("Preco.count", -1) do
      delete preco_url(@preco)
    end

    assert_redirected_to precos_url
  end
end

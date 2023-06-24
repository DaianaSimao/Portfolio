require "test_helper"

class EstacionamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estacionamento = estacionamentos(:one)
  end

  test "should get index" do
    get estacionamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_estacionamento_url
    assert_response :success
  end

  test "should create estacionamento" do
    assert_difference("Estacionamento.count") do
      post estacionamentos_url, params: { estacionamento: { preco_id: @estacionamento.preco_id, vaga_id: @estacionamento.vaga_id, veiculo_id: @estacionamento.veiculo_id } }
    end

    assert_redirected_to estacionamento_url(Estacionamento.last)
  end

  test "should show estacionamento" do
    get estacionamento_url(@estacionamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_estacionamento_url(@estacionamento)
    assert_response :success
  end

  test "should update estacionamento" do
    patch estacionamento_url(@estacionamento), params: { estacionamento: { preco_id: @estacionamento.preco_id, vaga_id: @estacionamento.vaga_id, veiculo_id: @estacionamento.veiculo_id } }
    assert_redirected_to estacionamento_url(@estacionamento)
  end

  test "should destroy estacionamento" do
    assert_difference("Estacionamento.count", -1) do
      delete estacionamento_url(@estacionamento)
    end

    assert_redirected_to estacionamentos_url
  end
end

require "test_helper"

class VagasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vaga = vagas(:one)
  end

  test "should get index" do
    get vagas_url
    assert_response :success
  end

  test "should get new" do
    get new_vaga_url
    assert_response :success
  end

  test "should create vaga" do
    assert_difference("Vaga.count") do
      post vagas_url, params: { vaga: { andar: @vaga.andar, numero_vaga: @vaga.numero_vaga } }
    end

    assert_redirected_to vaga_url(Vaga.last)
  end

  test "should show vaga" do
    get vaga_url(@vaga)
    assert_response :success
  end

  test "should get edit" do
    get edit_vaga_url(@vaga)
    assert_response :success
  end

  test "should update vaga" do
    patch vaga_url(@vaga), params: { vaga: { andar: @vaga.andar, numero_vaga: @vaga.numero_vaga } }
    assert_redirected_to vaga_url(@vaga)
  end

  test "should destroy vaga" do
    assert_difference("Vaga.count", -1) do
      delete vaga_url(@vaga)
    end

    assert_redirected_to vagas_url
  end
end

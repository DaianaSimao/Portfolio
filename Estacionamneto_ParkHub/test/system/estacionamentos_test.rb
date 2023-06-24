require "application_system_test_case"

class EstacionamentosTest < ApplicationSystemTestCase
  setup do
    @estacionamento = estacionamentos(:one)
  end

  test "visiting the index" do
    visit estacionamentos_url
    assert_selector "h1", text: "Estacionamentos"
  end

  test "should create estacionamento" do
    visit estacionamentos_url
    click_on "New estacionamento"

    fill_in "Preco", with: @estacionamento.preco_id
    fill_in "Vaga", with: @estacionamento.vaga_id
    fill_in "Veiculo", with: @estacionamento.veiculo_id
    click_on "Create Estacionamento"

    assert_text "Estacionamento was successfully created"
    click_on "Back"
  end

  test "should update Estacionamento" do
    visit estacionamento_url(@estacionamento)
    click_on "Edit this estacionamento", match: :first

    fill_in "Preco", with: @estacionamento.preco_id
    fill_in "Vaga", with: @estacionamento.vaga_id
    fill_in "Veiculo", with: @estacionamento.veiculo_id
    click_on "Update Estacionamento"

    assert_text "Estacionamento was successfully updated"
    click_on "Back"
  end

  test "should destroy Estacionamento" do
    visit estacionamento_url(@estacionamento)
    click_on "Destroy this estacionamento", match: :first

    assert_text "Estacionamento was successfully destroyed"
  end
end

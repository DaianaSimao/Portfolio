require "application_system_test_case"

class VeiculosTest < ApplicationSystemTestCase
  setup do
    @veiculo = veiculos(:one)
  end

  test "visiting the index" do
    visit veiculos_url
    assert_selector "h1", text: "Veiculos"
  end

  test "should create veiculo" do
    visit veiculos_url
    click_on "New veiculo"

    fill_in "Cor", with: @veiculo.cor
    fill_in "Marca", with: @veiculo.marca
    fill_in "Modelo", with: @veiculo.modelo
    fill_in "Placa", with: @veiculo.placa
    fill_in "Tipo", with: @veiculo.tipo
    click_on "Create Veiculo"

    assert_text "Veiculo was successfully created"
    click_on "Back"
  end

  test "should update Veiculo" do
    visit veiculo_url(@veiculo)
    click_on "Edit this veiculo", match: :first

    fill_in "Cor", with: @veiculo.cor
    fill_in "Marca", with: @veiculo.marca
    fill_in "Modelo", with: @veiculo.modelo
    fill_in "Placa", with: @veiculo.placa
    fill_in "Tipo", with: @veiculo.tipo
    click_on "Update Veiculo"

    assert_text "Veiculo was successfully updated"
    click_on "Back"
  end

  test "should destroy Veiculo" do
    visit veiculo_url(@veiculo)
    click_on "Destroy this veiculo", match: :first

    assert_text "Veiculo was successfully destroyed"
  end
end

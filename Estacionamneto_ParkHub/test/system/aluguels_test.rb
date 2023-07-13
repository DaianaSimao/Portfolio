require "application_system_test_case"

class AluguelsTest < ApplicationSystemTestCase
  setup do
    @aluguel = aluguels(:one)
  end

  test "visiting the index" do
    visit aluguels_url
    assert_selector "h1", text: "Aluguels"
  end

  test "should create aluguel" do
    visit aluguels_url
    click_on "New aluguel"

    fill_in "Estacionamento", with: @aluguel.estacionamento_id
    fill_in "Hora saida", with: @aluguel.hora_saida
    fill_in "Preco final", with: @aluguel.preco_final
    click_on "Create Aluguel"

    assert_text "Aluguel was successfully created"
    click_on "Back"
  end

  test "should update Aluguel" do
    visit aluguel_url(@aluguel)
    click_on "Edit this aluguel", match: :first

    fill_in "Estacionamento", with: @aluguel.estacionamento_id
    fill_in "Hora saida", with: @aluguel.hora_saida
    fill_in "Preco final", with: @aluguel.preco_final
    click_on "Update Aluguel"

    assert_text "Aluguel was successfully updated"
    click_on "Back"
  end

  test "should destroy Aluguel" do
    visit aluguel_url(@aluguel)
    click_on "Destroy this aluguel", match: :first

    assert_text "Aluguel was successfully destroyed"
  end
end

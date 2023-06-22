require "application_system_test_case"

class PrecosTest < ApplicationSystemTestCase
  setup do
    @preco = precos(:one)
  end

  test "visiting the index" do
    visit precos_url
    assert_selector "h1", text: "Precos"
  end

  test "should create preco" do
    visit precos_url
    click_on "New preco"

    fill_in "Preco hora", with: @preco.preco_hora
    fill_in "Veiculo", with: @preco.veiculo_id
    click_on "Create Preco"

    assert_text "Preco was successfully created"
    click_on "Back"
  end

  test "should update Preco" do
    visit preco_url(@preco)
    click_on "Edit this preco", match: :first

    fill_in "Preco hora", with: @preco.preco_hora
    fill_in "Veiculo", with: @preco.veiculo_id
    click_on "Update Preco"

    assert_text "Preco was successfully updated"
    click_on "Back"
  end

  test "should destroy Preco" do
    visit preco_url(@preco)
    click_on "Destroy this preco", match: :first

    assert_text "Preco was successfully destroyed"
  end
end

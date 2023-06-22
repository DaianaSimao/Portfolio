class Cep
  attr_reader :logradouro, :bairro, :localidade, :uf

  def initialize(cep)
    cep_encontrado = encontrar_cep()
    preencher_dados(cep_encontrado)

  end

  def encontrar_cep

  end
end
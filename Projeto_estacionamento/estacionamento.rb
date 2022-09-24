require_relative 'metodos'
include ProjetoEstacionamento


cliente = Estacionamento.new
data = Time.new
data = data.to_a
opcao =


while opcao != 4 do   
    puts "========================================"
    puts "    #{Time.utc(*data)}"
    puts " "
    puts "BEM-VINDO AO ESTACIONAMENTO 2 IRMÕES"
    puts "========================================"
    puts "Escolha uma opção: "
    puts "[1]. Cadastrar veículo"
    puts "[2]. Remover veículo"
    puts "[3]. Listar veículos"
    puts "[4]. Encerrar"
    puts "Digite uma opção: "
    puts " "
    opcao = gets.chomp.to_i
    case opcao
    when 1
        
        cliente.adicionarVeiculo()
    when 2
        cliente.removerVeiculo()
    when 3
        cliente.listarVeiculos()
    end
    puts " "
    puts "Pressione para continuar..."
    continuar = gets
    system "clear"
end




module ProjetoEstacionamento
    class Estacionamento
        attr_accessor :precoInicial, :precoPorHora, :veiculos
        def initialize (precoInicial = 5.00,precoPorHora = 2.00, veiculos = [])
            @precoInicial = precoInicial
            @precoPorHora = precoPorHora
            @veiculos = veiculos
        end

        def adicionarVeiculo
            puts "Digite a placa do veículo para estacionar: "
            placa = gets.chomp
            @veiculos << placa.upcase
            puts "Veiculo adicionado com sucesso!!"
        end

        def removerVeiculo()
            puts "Digite a placa do veiculo: "
            placa = gets.chomp 
            total = 0
            @veiculos.each do |veiculo|
                if placa.upcase == veiculo
                    puts "Digite as horas que o veiculo permaneceu no estacionamento: "
                    horas = gets.chomp.to_f
                    total = @precoInicial +(@precoPorHora * horas)
                    puts "Total a pagar: R$#{total}"
                else
                    puts "Veiculo nao cadastrado!"
                end
                @veiculos.delete(placa.upcase)
            end

        end

        def listarVeiculos
            if @veiculos.length != 0 
                puts @veiculos
            else
                puts "Não há veiculos estacionado!"
            end
        end
    end
end
    

module ProjetoEstacionamento
    class Estacionamento
        attr_accessor :preco_inicial, :preco_por_hora, :veiculos
        def initialize (preco_inicial = 5.00,preco_por_hora = 2.00, veiculos = [])
            @preco_inicial = preco_inicial
            @preco_por_hora = preco_por_hora
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
                    total = @preco_inicial +(@preco_por_hora * horas)
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
    

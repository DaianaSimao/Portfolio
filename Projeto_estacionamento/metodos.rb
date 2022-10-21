module ProjetoEstacionamento
    class Estacionamento
        attr_accessor :preco_inicial, :preco_por_hora, :veiculos
        def initialize (preco_inicial = 5.00,preco_por_hora = 2.00, veiculos = [])
            @preco_inicial = preco_inicial
            @preco_por_hora = preco_por_hora
            @veiculos = veiculos
        end

        def adicionar_veiculo
            puts "Digite a placa do veículo para estacionar: "
            placa = gets.chomp
            @veiculos << placa.upcase
            puts "Veiculo adicionado com sucesso!!"
        end

        def remover_veiculo()
            puts "Digite a placa do veiculo: "
            placa = gets.chomp 
            total = 0
            @veiculos.each do |veiculo|
                if placa.upcase == veiculo
                    puts "Digite as horas que o veiculo permaneceu no estacionamento: "
                    horas = gets.chomp.to_f
                    total = @preco_inicial +(@preco_por_hora * horas)
                    dias_da_semana(total)
                else
                    puts "Veiculo nao cadastrado!"
                end
                @veiculos.delete(placa.upcase)
            end
        end

        def dias_da_semana(total)
            puts "Escolha qual é o dia da semana:"
            puts "[1] Segunda"
            puts "[2] Terça"
            puts "[3] Quarta"
            puts "[4] Quinta"
            puts "[5] Sexta"

            dia = gets.chomp.to_i
            case dia
            when 1
                desconto = total - 2
                puts "Hoje é dia promoção, o cliente ganhou R$ 2,00 de desconto no valor #{total}"
                puts "Total a pagar #{desconto}"
            when 2
                puts "Hoje não tem promoção"
                puts "Total a pagar #{total}"
            when 3
                desconto = total - 2
                puts "Hoje é dia promoção, o cliente ganhou R$ 2,00 de desconto no valor #{total}"
                puts "Total a pagar #{desconto}"
            when 4
                puts "Hoje não tem promoção"
                puts "Total a pagar #{total}"
            when 5
                desconto = total - 2
                puts "Hoje é dia promoção, o cliente ganhou R$ 2,00 de desconto no valor #{total}"
                puts "Total a pagar #{desconto}"
            end

            if dia > 5 
                puts "Dia da semana invalido"
                puts "Pressione para continuar"
                continuar = gets
                dias_da_semana(total)
            end
        end
                

        def listar_veiculos
            if @veiculos.length != 0 
                puts @veiculos
            else
                puts "Não há veiculos estacionado!"
            end
        end
    end
end
    

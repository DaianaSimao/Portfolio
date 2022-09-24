INSERIR_RECEITA = 1
VISUALIZAR_RECEITA = 2
BUSCAR_RECEITA = 3
SAIR = 4

def bem_vindo
    puts ("Bem-Vindo ao CookBook, sua rede social de receitas")
end

def menu()
    puts "[#{INSERIR_RECEITA}] Cadastrar uma receita"
    puts "[#{VISUALIZAR_RECEITA}] Ver todas as receitas"
    puts "[#{BUSCAR_RECEITA}] Buscar receita"
    puts "[#{SAIR}] Sair"
    puts
    print "Escolha uma opção: "
    return gets.to_i()
end

def inserir_receita()
    puts
    puts "Digite o nome da receita: "
    nome = gets.chomp()
    puts
    puts "Digite o tipo da receita: "
    tipo = gets.chomp()
    puts
    puts "Receita #{nome} cadastrada com sucesso!"
    puts
    return { nome: nome, tipo: tipo }
end

def imprimir_receita(r)
    puts"============ Receitas cadastradas ============"
        r.each do |receita|
            puts "#{receita[:nome]} - #{receita[:tipo]}"
        end
        puts
        if r.empty?
            puts "Nenhuma receita cadastrada"
        end
end

def buscar_receita(receitas)
    puts "Qual receita vc deseja buscar: "
    nome = gets.chomp
    receitas.each do |receita|
        if receita[:nome] == nome
            puts "Receita Encontrada: #{receita[:nome]} - #{receita[:tipo]}"
        else
            puts "Receita nao cadastrada"
        end
    end
end
bem_vindo()

receitas = []

opção = menu()
print " \e[2J\e[f" # Caractere especial que limpa tela

loop do
    if(opção == INSERIR_RECEITA)
        receitas << inserir_receita() 
    elsif(opção == VISUALIZAR_RECEITA)
        imprimir_receita(receitas)
    elsif(opção == BUSCAR_RECEITA)
        buscar_receita(receitas)
    elsif( opção == SAIR)
        break
    else
        puts "Opção inválida"
    end
opção = menu()
end

puts "Obrigado por usar o CookBook! Até logo."
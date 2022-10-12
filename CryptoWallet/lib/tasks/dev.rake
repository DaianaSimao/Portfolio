namespace :dev do
  desc "Configura o ambientede desenvolvimento"
  task setup: :environment do  
    if Rails.env.development?
      show_spinner("Apagando ") {%x(rails db:drop)}
      show_spinner("Criando ") {%x(rails db:create)}
      show_spinner("Migrando ") {%x(rails db:migrate)}
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)

    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end



  desc "Cadastra  as moedas"
  task add_coins: :environment do 
    show_spinner("Cadastrando as moedas ") do
    coins=[
            {
              description: "Bitcoin",
              acronym: "BTC",
              url_image: "https://toppng.com/public/uploads/preview/bitcoin-png-bitcoin-logo-transparent-background-11562933997uxok6gcqjp.png"
            },
            {
              description: "Ethereum",
              acronym: "ETH",
              url_image: "https://image.pngaaa.com/466/1559466-middle.png"
            },
            {
              description: "Dash",
              acronym: "DASH",
              url_image: "https://logos-download.com/wp-content/uploads/2018/04/Dash_logo_blue.png"
            }
          ]

  coins.each do |coin|
      sleep(1)
      Coin.find_or_create_by!(coin)
  
  end
end
end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do 
    show_spinner("Cadastrando tipos de mineração...")
    mining_types = [
      {name: "Proof of Work", acronym: "PoW"},
      {name: "Proof of Stake", acronym: "PoS"},
      {name: "Proof of Capacity", acronym: "PoC"}
    ]


    mining_types.each do |mining_type|
      MiningType.find_or_create_by!(mining_type)
    end   
  end
 
  


  private
  
  def show_spinner(msg_start, msg_end = "Concluido!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}o BD...")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end



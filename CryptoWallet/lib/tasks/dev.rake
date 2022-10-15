namespace :dev do
  desc "Configura o ambientede desenvolvimento"
  task setup: :environment do  
    if Rails.env.development?
      show_spinner("Apagando o BD ") {%x(rails db:drop)}
      show_spinner("Criando o BD ") {%x(rails db:create)}
      show_spinner("Migrando o BD ") {%x(rails db:migrate)}
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
     

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
              url_image: "https://toppng.com/public/uploads/preview/bitcoin-png-bitcoin-logo-transparent-background-11562933997uxok6gcqjp.png",
              mining_type: MiningType.find_by(acronym: "PoW")
            },
            {
              description: "Ethereum",
              acronym: "ETH",
              url_image: "https://image.pngaaa.com/466/1559466-middle.png",
              mining_type: MiningType.all.sample
            },
            {
              description: "Dash",
              acronym: "DASH",
              url_image: "https://logos-download.com/wp-content/uploads/2018/04/Dash_logo_blue.png",
              mining_type: MiningType.all.sample
            },
            {
              description: "Iota",
              acronym: "IOT",
              url_image: "https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/1024/IOTA-MIOTA-icon.png",
              mining_type: MiningType.all.sample
            },
            {
              description: "ZCash",
              acronym: "ZEC",
              url_image: "https://cryptologos.cc/logos/zcash-zec-logo.png",
              mining_type: MiningType.all.sample
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
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]


    mining_types.each do |mining_type|
      MiningType.find_or_create_by!(mining_type)
    end   
  end
 
  


  private
  
  def show_spinner(msg_start, msg_end = "Concluido!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin

    spinner.success("(#{msg_end})")
  end
end



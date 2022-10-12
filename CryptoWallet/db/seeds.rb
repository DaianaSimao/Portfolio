# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas...")
spinner.auto_spin

coins =[
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
    Coin.find_or_create_by(coin)
end  

spinner.success("(Concluido!!)")
namespace :dev do
  desc "Configura o ambientede desenvolvimento"
  task setup: :environment do  
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Apagando BD...")
      spinner.auto_spin
      spinner.success("(Concluido com sucesso!)")
      %x(rails db:drop) 
      spinner.success("(Concluido com sucesso!)")
      spinner = TTY::Spinner.new("[:spinner] Criando o BD...")
      spinner.auto_spin
      %x(rails db:create)
      spinner.success("(Concluido com sucesso!)")
      spinner = TTY::Spinner.new("[:spinner] Migrando o BD...")
      spinner.auto_spin
      %x(rails db:migrate)
      spinner.success("(Concluido com sucesso!)")
      spinner = TTY::Spinner.new("[:spinner] Populando o BD...")
      spinner.auto_spin
      %x(rails db:seed)
      spinner.success("(Concluido com sucesso!)")
    else
      puts "Você não está em ambiente de desebvolvimento!"
    end
  end

end

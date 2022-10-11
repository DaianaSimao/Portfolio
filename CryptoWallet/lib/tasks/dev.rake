namespace :dev do
  desc "Configura o ambientede desenvolvimento"
  task setup: :environment do  
    if Rails.env.development?
      show_spinner("Apagando ") {%x(rails db:drop)}
      show_spinner("Criando ") {%x(rails db:create)}
      show_spinner("Migrando ") {%x(rails db:migrate)}
      show_spinner("Populando ") {%x(rails db:seed)}

    else
      puts "Você não está em ambiente de desenvolvimento!"
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

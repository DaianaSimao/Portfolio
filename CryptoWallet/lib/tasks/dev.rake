namespace :dev do
  desc "Configura o ambientede desenvolvimento"
  task setup: :environment do
    puts %x(rails db:drop db:create db:migrate db:seed)
  end

end

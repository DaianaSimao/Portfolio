namespace :admin do
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Cria um novo funcionario"
  task criar_novo_funcionario: :environment do
    # Criação de um novo usuário
    user = User.create(email: "func2.ph@ph.com",
      password: "123456",
      role: "Funcionario")
    puts "Novo usuário criado: #{user.email}"
  end
end
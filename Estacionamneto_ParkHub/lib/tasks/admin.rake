namespace :admin do
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Adciona o administrador padrão"
  task add_default_admin: :environment do
    puts "========INICIO DA TASK========"
    Admin.create!(
      email: "daiana.admin@teste.com",
      password:"123456",
      password_confirmation: "123456"
    )
    puts "=========FIM DA TASK=========="
  end

  desc "Adiciona o funcionario padrão"
  task add_default_funcionario: :environment do 
    Funcionario.create!(
      email: "igor.21@teste.com",
      password: "123456",
      password_confirmation: "123456"
    )
  end

  desc 'Cadastra usuários admin e funcionario'
  task cadastrar_admin_func_default: :environment do
    User.create!(
      email: 'admin.ph@admin.com',
      password: '123456',
      password_confirmation: '123456',
      role: :admin
    )
    
    User.create!(
      email: 'func.ph@func.com',
      password: '123456',
      password_confirmation: '123456',
      role: :funcionario
    )
    
    puts 'Usuários admin e funcionario cadastrados com sucesso!'
  end
end
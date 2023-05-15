namespace :dev do

  DEFAULT_PASSWORD = 123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')
  desc "Configurar o ambiente de desenvolvimento"
  task setup: :environment do 
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Cadastrando o administrador padrão...") { %x(rails dev:add_default_admin) }
      show_spinner("Cadastrando administradores extras...") { %x(rails dev:add_extra_admins) }
      show_spinner("Cadastrando usuário padrão...") { %x(rails dev:add_default_user) }
      show_spinner("Cadastrando os assuntos padrões...") { %x(rails dev:add_subjects) }
      show_spinner("Cadastrando perguntas e respostas...") { %x(rails dev:add_answers_and_questions) }

    else
      puts "Você não esta em ambiente de desenvolvimento"
    end
  end

  desc "Adciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: "admin@admin.com",
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )  
  end

  desc "Adiciona administradores extras"
  task add_extra_admins: :environment do
    10.times do |i|
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do 
    User.create!(
      email: "user@user.com",
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona assuntos padrões"
  task add_subjects: :environment do
    file_name = "subjects.txt"
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Subject.create!(description: line.strip)
    end
  end

  desc "Adiciona perguntas e respostas"
  task add_answers_and_questions: :environment do
    Subject.all.each do |subject|

      # Criando as Perguntas com a descrição, subject(subject_id), respostas.
      rand(5..10).times do |i|
        params = create_question_params(subject)
        answers_array = params[:question][:answers_attributes]

        # Criando respostas que vão ser de 2 a 5. Todas vão ser falsas
        add_answers(answers_array)

        # Substituindo uma das respostas falsa por uma verdadeira
        elect_true_answers(answers_array)

        # Criando a questões com as respostas
        Question.create!(params[:question])
      end
    end 
  end

  private

  def create_answers_params(correct = false)
    # Metodo para criar as respostas
    {description:Faker::Lorem.sentence, correct: correct }
  end

  def add_answers(answers_array = [])
    # Metodo para adcionar as respostas as perguntas, as respostas vão ser de 2 a 5. Todas vão ser falsas
    rand(2..5).times do |j|
      answers_array.push(
        create_answers_params
      )
    end
  end

  def elect_true_answers(answers_array= [])
    # Metodo para eleger uma respostas verdadeira
    select_index = rand(answers_array.size)
    answers_array[select_index] = create_answers_params(true)
  end

  def create_question_params(subject)
    # Metodo para criar as Perguntas com a descrição, subject(subject_id), respostas.
    { question: {
      description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question} ",
      subject: subject,
      answers_attributes:[]
      }
    }
  end

  def show_spinner(msg_start, msg_end = "Concluido!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
 
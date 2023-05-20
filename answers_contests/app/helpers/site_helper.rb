module SiteHelper
  def msg_jumbotron
    case params[:action]
    when 'index'
      "Últimas perguntas cadastradas..."
    when 'questions'
      "Resultado para os termos \"#{params[:term]}\"..."
    when 'subject'
      "Mostrando perguntas para o assunto \"#{params[:subject]}\"...."
    end
  end
end

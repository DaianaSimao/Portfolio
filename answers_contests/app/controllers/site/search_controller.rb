class Site::SearchController < SiteController
  def questions
    # params[:term]
    # @questions = Question.includes(:answers).page(params[:page])
    @questions = Question.search(params[:page], params[:term])
  end
end

class UsersBackoffice::ZipCodeController < ApplicationController
  def show
    @cep = Cep.new(params[:zip_code])

  end
end

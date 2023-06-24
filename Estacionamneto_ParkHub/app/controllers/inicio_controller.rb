class InicioController < ApplicationController
  def index
    @estacionamentos = Estacionamento.all
  end
end

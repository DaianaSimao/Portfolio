class CheckinsController < ApplicationController
  before_action :set_checkin, only: [:show, :edit, :update, :destroy]

  def index
    @checkins = Checkin.all
  end

  def show
  end

  def new
    @checkin = Checkin.new
  end

  def create
    @checkin = Checkin.new(checkin_params)
    @checkin.vaga_vaga_nome = @checkin.vaga.vaga_nome
    @checkin.preco_tipo = @checkin.preco.tipo
    @checkin.preco_preco_hora = @checkin.preco.preco_hora

    if @checkin.save
      redirect_to @checkin, notice: 'Check-in criado com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @checkin.update(checkin_params)
      redirect_to @checkin, notice: 'Check-in atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @checkin.destroy
    redirect_to checkins_url, notice: 'Check-in excluído com sucesso.'
  end

  private

  def set_checkin
    @checkin = Checkin.find(params[:id])
  end

  def checkin_params
    params.require(:checkin).permit(:veiculo_placa, :veiculo_marca, :veiculo_modelo, :veiculo_cor,:preco_tipo,:preco_preco_hora, :vaga_vaga_nome, :status, :veiculo_id, :preco_id, :vaga_id)
  end
end

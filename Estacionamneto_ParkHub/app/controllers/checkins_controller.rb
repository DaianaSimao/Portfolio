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
    params.require(:checkin).permit(:placa, :marca, :modelo, :cor, :veiculo_id, :preco_id, :vaga_id, :vaga_status)
  end
end

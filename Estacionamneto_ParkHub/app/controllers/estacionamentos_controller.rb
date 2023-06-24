class EstacionamentosController < ApplicationController
  before_action :set_estacionamento, only: %i[ show edit update destroy ]

  # GET /estacionamentos or /estacionamentos.json
  def index
    @estacionamentos = Estacionamento.all
  end

  # GET /estacionamentos/1 or /estacionamentos/1.json
  def show
  end

  # GET /estacionamentos/new
  def new
    estacionamento = Estacionamento.new
    @estacionamento = Estacionamento.dados_estacionamento
    @estacionamento = estacionamento
  end

  # GET /estacionamentos/1/edit
  def edit
  end

  # POST /estacionamentos or /estacionamentos.json
  def create
    @estacionamento = Estacionamento.new(estacionamento_params)

    respond_to do |format|
      if @estacionamento.save
        format.html { redirect_to estacionamento_url(@estacionamento), notice: "Estacionamento was successfully created." }
        format.json { render :show, status: :created, location: @estacionamento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @estacionamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estacionamentos/1 or /estacionamentos/1.json
  def update
    respond_to do |format|
      if @estacionamento.update(estacionamento_params)
        format.html { redirect_to estacionamento_url(@estacionamento), notice: "Estacionamento was successfully updated." }
        format.json { render :show, status: :ok, location: @estacionamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estacionamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estacionamentos/1 or /estacionamentos/1.json
  def destroy
    @estacionamento.destroy

    respond_to do |format|
      format.html { redirect_to estacionamentos_url, notice: "Estacionamento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estacionamento
      @estacionamento = Estacionamento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estacionamento_params
      params.require(:estacionamento).permit(:veiculo_id, :vaga_id, :preco_id)
    end
end

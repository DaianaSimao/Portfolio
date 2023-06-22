class PrecosController < ApplicationController
  before_action :set_preco, only: %i[ show edit update destroy ]

  # GET /precos or /precos.json
  def index
    @precos = Preco.all
  end

  # GET /precos/1 or /precos/1.json
  def show
  end

  # GET /precos/new
  def new
    @preco = Preco.new
  end

  # GET /precos/1/edit
  def edit
  end

  # POST /precos or /precos.json
  def create
    @preco = Preco.new(preco_params)

    respond_to do |format|
      if @preco.save
        format.html { redirect_to preco_url(@preco), notice: "Preco was successfully created." }
        format.json { render :show, status: :created, location: @preco }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @preco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /precos/1 or /precos/1.json
  def update
    respond_to do |format|
      if @preco.update(preco_params)
        format.html { redirect_to preco_url(@preco), notice: "Preco was successfully updated." }
        format.json { render :show, status: :ok, location: @preco }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @preco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /precos/1 or /precos/1.json
  def destroy
    @preco.destroy

    respond_to do |format|
      format.html { redirect_to precos_url, notice: "Preco was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preco
      @preco = Preco.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def preco_params
      params.require(:preco).permit(:veiculo_id, :preco_hora)
    end
end

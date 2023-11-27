class ResgatesController < ApplicationController
  #before_action :set_resgate, only: %i[ show edit update destroy ]

  # GET /resgates or /resgates.json
  def index
    @resgates = Resgate.all
  end

  # # GET /resgates/1 or /resgates/1.json
  # def show
  # end

  # GET /resgates/new
  def new
    @resgate = Resgate.new
  end

  # # GET /resgates/1/edit
  # def edit
  # end

  # POST /resgates or /resgates.json
  def create
    @resgate = Resgate.new(resgate_params)
    respond_to do |format|
      if @resgate.save
        flash.now[:notice] = "Solicitação enviada!"
        @resgate_empty = Resgate.new
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("flash-messages", partial: "shared/flash_message"),
            turbo_stream.replace(
              "resgate-turbo-form",
              partial: "resgates/form",
              locals: {
                resgate: @resgate_empty
              } 
            )
          ]
        end
        format.html { redirect_to new_resgate_url, notice: "Sua solicitação foi enviada!" }
        format.json { render :show, status: :created, location: @resgate }
        puts "Salvou resgate!!"
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resgate.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /resgates/1 or /resgates/1.json
  # def update
  #   respond_to do |format|
  #     if @resgate.update(resgate_params)
  #       format.html { redirect_to resgate_url(@resgate), notice: "Resgate was successfully updated." }
  #       format.json { render :show, status: :ok, location: @resgate }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @resgate.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /resgates/1 or /resgates/1.json
  # def destroy
  #   @resgate.destroy!

  #   respond_to do |format|
  #     format.html { redirect_to resgates_url, notice: "Resgate was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resgate
      @resgate = Resgate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resgate_params
      params.require(:resgate).permit(:nome, :email, :phone, :chave, :cpfcnpj, :agree, :privacidade)
    end
end

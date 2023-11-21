class SubscriptionsController < ApplicationController
  # before_action :set_subscription, only: %i[ show edit update destroy ]
  before_action :set_subscription, only: %i[ show ]
  ##protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  # GET /subscriptions or /subscriptions.json
  def index
    @subscriptions = Subscription.all
  end

  # GET /subscriptions/1 or /subscriptions/1.json
  # def show
  # end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
    ##flash.now[:notice] = "foi via flash now"
    ##flash[:notice] = "foi via flash notice"
  end

  # GET /subscriptions/1/edit
  # def edit
  # end

  # POST /subscriptions or /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      flash.now[:notice] = "salvou via flash now"
      render turbo_stream: [
                turbo_stream.replace(
                  "turbo_id",
                  partial: "shared/flash_message",
                  locals: {
                    # ...
                  },
                ),
                turbo_stream.replace("flash-messages", partial: "shared/flash_message"),
              ]
    else
      #flash.now[:error] = "Failed to update submission."
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
      end
    end

    

=begin
    respond_to do |format|
      if @subscription.save
        ##format.html { redirect_to subscription_url(@subscription), notice: "Subscription was successfully created." }
        format.html { redirect_to new_subscription_url, notice: "Sua solicitação foi enviada!" }
        ##format.html { redirect_to new_subscription_url, flash[:success] = "Foi via flash" }
        flash[:success] = "Foi via flash"
        ##format.html { render :new, notice: "Sua solicitação foi enviada!" }
        ##format.turbo_stream { redirect_to new_subscription_url, flash[:notice] = "foi via turbo flash" }
        format.turbo_stream { redirect_to new_subscription_url, notice: "Sua solicitação foi enviada via turbo stream!" }
        flash.keep[:notice] = "foi via flash keep"
        flash.now[:notice] = "foi via flash now"
        ##render :new, status: :unprocessable_entity
        format.json { render :show, status: :created, location: @subscription }
        puts "Salvou!!"
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # PATCH/PUT /subscriptions/1 or /subscriptions/1.json
  # def update
  #   respond_to do |format|
  #     if @subscription.update(subscription_params)
  #       format.html { redirect_to subscription_url(@subscription), notice: "Subscription was successfully updated." }
  #       format.json { render :show, status: :ok, location: @subscription }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @subscription.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /subscriptions/1 or /subscriptions/1.json
  # def destroy
  #   @subscription.destroy!

  #   respond_to do |format|
  #     format.html { redirect_to subscriptions_url, notice: "Subscription was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subscription_params
      params.require(:subscription).permit(:name, :phone, :email, :city, :province, :profile, :agree)
    end
end

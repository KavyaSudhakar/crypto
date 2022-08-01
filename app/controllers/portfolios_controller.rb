class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %i[show edit update destroy]

  # GET /portfolios or /portfolios.json
  def index
    @portfolios = Portfolio.all
    require 'net/http'
    $uri = URI('https://api.nomics.com/v1/currencies/ticker?key=cbb0c66bb0a2e32400cb99ffd8eee89b05cf05fd&ids')
    $response = Net::HTTP.get($uri)
    $lookup_portfolio = JSON.parse($response)
  end

  # GET /portfolios/new
  def new
    @portfolio = Portfolio.new
  end

  # GET /portfolios/1/edit
  def edit; end

  def show; end

  # POST /portfolios or /portfolios.json
  def create
    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolio_url(@portfolio), notice: 'Portfolio was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolios/1 or /portfolios/1.json
  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolio_url(@portfolio), notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1 or /portfolios/1.json
  def destroy
    @portfolio.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Crypto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def portfolio_params
    params.require(:portfolio).permit(:symbol, :user_id, :cost_per, :amount_owned)
  end

  def correct_user
    @correct = current_user.portfolios.find_by(id: params[:id])
    redirect_to portfolios_path, notice: 'Not Authorized to edit this entry' if @correct.nil?
  end
end

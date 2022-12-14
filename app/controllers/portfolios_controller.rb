class PortfoliosController < ApplicationController
	
	def index
		@portfolio_items = Portfolio.all
	end

	def new
	 @portfolio_item = Portfolio.new
	end

	def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  	@portfolio_item = Portfolio.find(params[:id])
  end

  def update
  	@portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def show
  	@portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
  	@portfolio_item = Portfolio.find(params[:id])
    @portfolio_item.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Blog was successfully destroyed." }
    end
  end

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end

end

class PortfoliosController < ApplicationController

  def index #generally where a whole list is displayed
    @portfolioItems = Portfolio.all 
    #This is a call to the Portfolio MODEL from this CONTROLLER and assigning 
    # the values of all Portfolio items to @portfolio_items which can be accessed by the view
    #In order to make use of @portfolio_items a file in views must be made for portfolios index 'index.html.erb'
  end


  def new
    @portfolioItem = Portfolio.new 
  end


  def create
    @portfolioItem = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolioItem.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

end

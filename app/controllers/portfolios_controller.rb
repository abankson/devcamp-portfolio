class PortfoliosController < ApplicationController

  def index #generally where a whole list is displayed
    @portfolioItems = Portfolio.all 
    #This is a call to the Portfolio MODEL from this CONTROLLER and assigning 
    # the values of all Portfolio items to @portfolio_items which can be accessed by the view
    #In order to make use of @portfolio_items a file in views must be made for portfolios index 'index.html.erb'
  end
end

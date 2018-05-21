class PortfoliosController < ApplicationController

  def index #generally where a whole list is displayed
    @portfolioItems = Portfolio.all 
    #This is a call to the Portfolio MODEL from this CONTROLLER and assigning 
    # the values of all Portfolio items to @portfolio_items which can be accessed by the view
    #In order to make use of @portfolio_items a file in views must be made for portfolios index 'index.html.erb'
  end

  def angular
    @portfolioItemsAngular = Portfolio.angular
  end


  def new
    @portfolioItem = Portfolio.new 
    #Hardcoded 3 technologies will be built for the instantiated Portfolio
    3.times { @portfolioItem.technologies.build }
  end


  def create
    @portfolioItem = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

    respond_to do |format|
      if @portfolioItem.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end


  def edit
    @portfolioItem = Portfolio.friendly.find(params[:id])
  end


  def show
    @portfolioItem = Portfolio.friendly.find(params[:id])
  end


  def update
    @portfolioItem = Portfolio.friendly.find(params[:id])

    respond_to do |format|
      if @portfolioItem.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    #The lookup
    @portfolioItem = Portfolio.friendly.find(params[:id])

    #This will destroy the record
    @portfolioItem.destroy

    #The redirect after destroying
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio record was removed.' }
    end
  end

end

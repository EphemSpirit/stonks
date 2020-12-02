class StocksController < ApplicationController

  def search
    if !params[:stock].empty?
      @stock = Stock.find_price(params[:stock])
      if @stock
        render 'users/my_portfolio'
      else
        flash[:alert] = "Please enter a valid symbol"
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = "Please enter a stock symbol"
      redirect_to my_portfolio_path
    end
  end

end
class StocksController < ApplicationController

  def search
    if !params[:stock].empty?
      @stock = Stock.find_price(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'shared/results' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid symbol"
          format.js { render partial: 'shared/results' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol"
        format.js { render partial: 'shared/results' }
      end
    end
  end

end

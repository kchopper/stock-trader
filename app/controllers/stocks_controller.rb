class StocksController < ApplicationController

  def search
  	if params[:stock].blank?
  		flash.now[:danger] = "You have entered an empty string" 
  	  else
  	  	@stock = Stock.look_up_stock(params[:stock])
  	  	flash.now[:danger] = "You have entered an invalid string" unless @stock	
  	  		end
  		respond_to do |format|  			 		
  			format.js { render partial: 'users/results' }
  	end
  end
end

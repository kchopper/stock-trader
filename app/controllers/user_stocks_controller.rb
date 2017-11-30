class UserStocksController < ApplicationController

  def create
    stock = Stock.find_by_ticker(params[:ticker])
    if stock.blank?
      stock = Stock.look_up_stock(params[:ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] = "Stock #{@user_stock.stock.name} added to your portfolio"
    redirect_to my_portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    @user_stocks = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    @user_stocks.destroy
    flash[:notice] = 'Stock was successfully removed'
    redirect_to my_portfolio_path
  end
end

class Stock < ApplicationRecord
	has_many :user_stocks
	has_many :users, through: :user_stocks

  def self.look_up_stock(ticker)
    begin
      stock = StockQuote::Stock.quote(ticker)
      price = strip_comma(stock.l)
      new(name: stock.name, ticker: stock.symbol, last_price: price)
    rescue Exception => e
      return nil
    end
  end

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  def self.strip_comma(number)
    number.gsub(",","")
  end
end

class Stock < ApplicationRecord

  def self.look_up_stock(ticker)
  	begin
  		stock = StockQuote::Stock.quote(ticker)
    	price = strip_comma(stock.l)
    	new(name: stock.name, ticker: stock.symbol, last_price: price)
  	rescue Exception => e
  		return nil
  	end
  end  

  def self.strip_comma(number)
    number.gsub(",","")
  end

end

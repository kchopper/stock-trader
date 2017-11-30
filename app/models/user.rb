# user model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships

  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
      "Anonymous"
  end

  def stock_already_added?(ticker_symbol)
    stock = Stock.find_by_ticker(ticker_symbol)
    return false unless stock
    user_stocks.where(stock_id: stock.id).exists?
  end

  def stock_under_limit?
    (user_stocks.count < 10)
  end

  def can_add_more_stock(ticker_symbol)
    !stock_already_added?(ticker_symbol) && stock_under_limit?
  end

  def self.search(params)
    params.strip!
    params.downcase!
    to_send_back = (search_by_first_name(params) + search_by_last_name(params) +
                    search_by_email(params)).uniq
    return nil unless to_send_back
    to_send_back
  end

  def self.search_by_first_name(params)
    matches('first_name', params)
  end

  def self.search_by_last_name(params)
    matches('last_name', params)
  end

  def self.search_by_email(params)
    matches('email', params)
  end

  def self.matches(field_name, params)
    User.where("#{field_name} like?", "%#{params}%")
  end
end

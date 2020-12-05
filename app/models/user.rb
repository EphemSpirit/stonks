class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  def can_track?(ticker)
    under_stock_limit? && !stock_already_tracked?(ticker)
  end

  def under_stock_limit?
    stocks.count < 10
  end

  def stock_already_tracked?(ticker)
    stock = Stock.check_db(ticker)
    return false unless stock
    stocks.where(id: stock.id).exists?
  end
end

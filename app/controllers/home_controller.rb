require 'foreign_exchange'

class HomeController < ApplicationController
  def index
    @currencies = ForeignExchange::ExchangeRate.currencies
  end
end

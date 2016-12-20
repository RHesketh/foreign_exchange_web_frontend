class ForexController < ApplicationController
  include ForeignExchange

  def exchange
    redirect_to root_path, :flash => { :error => "Date cannot be blank!" } and return if params[:date].blank?
    redirect_to root_path, :flash => { :error => "Amount cannot be blank!" } and return if params[:amount].blank?
    redirect_to root_path, :flash => { :error => "From currency cannot be blank!" } and return if params[:from_currency].blank?
    redirect_to root_path, :flash => { :error => "To currency cannot be blank!" } and return if params[:to_currency].blank?

    @amount = params[:amount].to_i
    @date = Date.parse(params[:date])
    @from_currency = params[:from_currency]
    @to_currency = params[:to_currency]

    begin
      @rate = ExchangeRate.at(@date, @from_currency, @to_currency)
    rescue ExchangeRate::UnknownDate
      redirect_to root_path, :flash => { :error => "Sorry, we do not have currency data for #{params[:date]}." } and return
    end

    @conversion = @rate * @amount
  end
end

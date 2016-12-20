begin
  ForeignExchange::ExchangeRate.parse_rates
rescue ForeignExchange::ExchangeRate::NoRatesFound
  STDERR.puts "Couldn't find any forex rates! Check that you have run `rates:download` before proceeding." unless Rails.env = "test"
end
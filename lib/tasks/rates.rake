require 'foreign_exchange'

ForeignExchange.configure do |config|
  config.rates_url = "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"
end

namespace :rates do
  desc "Downloads the latest rates from the URL specified"
  task download: :environment do
    ForeignExchange::RateDownloader.download
  end
end

require 'rails_helper'

feature "Front page" do
  before(:each) do
    ForeignExchange::ExchangeRate.rates = {
      '2016-12-02' => {
        'USD' => 2.0,
        'GBP' => 0.5
      }
    }
  end

  scenario "Loading the front page" do
    visit '/'
    expect(page).to have_content 'FX-u-like'
  end

  scenario "Performing a foreign currency transaction" do
    visit '/'
    fill_in "date", with: Date.parse('2016-12-02')
    fill_in "amount", with: "100"

    select "USD", from: "from_currency"
    select "GBP", from: "to_currency"
    click_on "Convert"

    expect(page).to have_content '100.00 USD is 25.00 GBP'
  end
end
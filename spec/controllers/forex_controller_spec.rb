require 'rails_helper'

RSpec.describe ForexController, type: :controller do
  describe "GET exchange" do
    context "All params have been supplied" do
      before(:each) do
        allow(ForeignExchange::ExchangeRate).to receive(:at).and_return(2.0)
        get :exchange, params: { amount: 100, to_currency: "GBP", from_currency: "USD", date: "2016-01-01"}
      end

      it "renders the exchange template" do
        expect(response).to render_template("exchange")
      end

      it "Performs a currency conversion" do
        expect(ForeignExchange::ExchangeRate).to receive(:at).and_return(2.0)
        get :exchange, params: { amount: 100, to_currency: "GBP", from_currency: "USD", date: "2016-01-01"}
      end

      it "Stores the amount that was converted" do
        expect(assigns(:amount)).to eq(100)
      end

      it "Stores the from currency that was converted" do
        expect(assigns(:from_currency)).to eq("USD")
      end

      it "Stores the to currency that was converted" do
        expect(assigns(:to_currency)).to eq("GBP")
      end

      it "Stores the rate that was converted" do
        expect(assigns(:rate)).to eq(2.0)
      end

      it "Stores the currency conversion that was converted" do
        expect(assigns(:conversion)).to eq(200)
      end
    end

    describe "Some params are missing" do
      it "Flags an error if the date is missing" do
        get :exchange, params: { amount: 100, to_currency: "GBP", from_currency: "USD"}
        expect(flash[:error]).to match(/Date/)
      end

      it "Flags an error if the amount is missing" do
        get :exchange, params: { date: '2016-01-01', to_currency: "GBP", from_currency: "USD"}
        expect(flash[:error]).to match(/Amount/)
      end

      it "Flags an error if the from_currency is missing" do
        get :exchange, params: { amount: 100, to_currency: "GBP", date: "2016-01-01" }
        expect(flash[:error]).to match(/From currency/)
      end

      it "Flags an error if the to_currency is missing" do
        get :exchange, params: { amount: 100, from_currency: "USD", date: "2016-01-01" }
        expect(flash[:error]).to match(/To currency/)
      end
    end

    describe "Some data is missing" do
      before(:each) do
        allow(ForeignExchange::ExchangeRate).to receive(:at).and_raise(ForeignExchange::ExchangeRate::UnknownDate)
      end

      it "Flags an error if there is no data for the given date" do
        get :exchange, params: { amount: 100, to_currency: "GBP", from_currency: "USD", date: "2016-01-01"}
        expect(flash[:error]).to match(/2016-01-01/)
      end
    end
  end
end

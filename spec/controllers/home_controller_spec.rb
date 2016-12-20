require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "Gets the list of currencies we have available" do
      expect(ForeignExchange::ExchangeRate).to receive(:currencies)
      get :index
    end
  end
end

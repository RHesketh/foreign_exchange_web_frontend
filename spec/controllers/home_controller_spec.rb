require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET index" do
    before(:each) do
      get :index
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end
end

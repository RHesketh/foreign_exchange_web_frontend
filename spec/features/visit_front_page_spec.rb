require 'rails_helper'

feature "Front page" do
  scenario "Loading the front page" do
    visit '/'
    expect(page).to have_content 'FX-u-like'
  end
end
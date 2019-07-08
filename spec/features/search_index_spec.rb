require 'rails_helper'

feature "user can search for gifs" do

  scenario "user submits valid string" do
    visit '/'

    fill_in "q", with: "Home"
    click_on "Search"
    expect(current_path).to eq(searchs_path)

    within(first(".gif")) do
      expect(page).to have_selector('li', count: 3)
    end

    within(first(".gif-block")) do
      expect(page).to have_selector('ul', count: 5)
    end
  end
end
require "spec_helper"
feature "homepage" do
  scenario "I arrive on the homepage" do
    visit root_path
    expect(page).to have_content "Todo App!"
    # expect(page).to have_css("ul#todos")
  end

end
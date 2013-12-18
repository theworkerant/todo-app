require "spec_helper"
feature "homepage" do
  
  let(:user) { create :user }
  before(:each) do
    3.times { create(:task, user: user) }
  end
  scenario "I arrive on the homepage" do
    login
    expect(page).to have_content "Todo App!"
    expect(page).to have_css("ul#tasks")
    expect(page.all("ul#tasks li")).to have(3).items
  end
  
  scenario "I see a particular task" do
    create(:task, title: "Get Milk", user:user)
    login
    expect(page).to have_content("Get Milk")
  end

end
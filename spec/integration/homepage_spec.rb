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
    create(:task, title: "Get Milk")
    login
    expect(page).to have_content("Get Milk")
  end

end

def login
  visit root_path
  fill_in "email", with: user.email
  fill_in "password", with: user.password
  click_on "Login"
end
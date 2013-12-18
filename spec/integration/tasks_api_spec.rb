require "spec_helper"
describe "Tasks API" do
  
  let(:user) { create :user }
  before(:each) do
    3.times { create :task, user:user}
    create :task, user: create(:user) # some other user
  end
  
  it "rejects bad access credentials" do
    get "tasks", {user_token: "abc123", user_email:user.email}
    expect(response.response_code).to eq 401
  end
  it "reject unauthorized access" do
    get "tasks"
    expect(response.response_code).to eq 401
  end
  
  it "get all user's tasks" do
    get "tasks", {user_token: user.authentication_token, user_email:user.email}
    expect(response).to be_success
    expect(json['tasks'].length).to eq(3)
  end
  it "get specific task" do
    get "tasks/1", {user_token: user.authentication_token, user_email:user.email}
    expect(response).to be_success
    expect(json["task"]["title"]).to eq("Some Important Task")
  end
  it "update a task" do
    patch "tasks/1", {user_token: user.authentication_token, user_email:user.email, task: {title: "Some edited title"} }
    expect(response).to be_success
    get "tasks/1", {user_token: user.authentication_token, user_email:user.email}
    expect(json["task"]["title"]).to eq("Some edited title")
  end
  it "complete a task" do
    patch "tasks/1", {user_token: user.authentication_token, user_email:user.email, task: {completed_at: Date.yesterday} }
    expect(response).to be_success
    get "tasks/1", {user_token: user.authentication_token, user_email:user.email}
    expect(json["task"]["complete"]).to be true
  end
  it "delete a task" do
    delete "tasks/1", {user_token: user.authentication_token, user_email:user.email, task: {completed_at: Date.yesterday} }
    expect(response.response_code).to eq 204
  end
  
  
end
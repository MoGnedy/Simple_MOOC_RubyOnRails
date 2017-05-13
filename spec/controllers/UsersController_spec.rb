require "rails_helper"
describe UsersController do
  it "GET #index show a list of all users" do
    User.create(email: 'aaa@gmail.com', name: 'Mohamed Gnedy',password:'123456',role_id:2)
    User.create(email: 'bbb@gmail.com', name: 'Mahmoud Gnedy',password:'123456',role_id:2)
    get :show
    expect(assigns[:users].size).to eq 2
  end
end

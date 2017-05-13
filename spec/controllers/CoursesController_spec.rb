require "rails_helper"
describe CoursesController do
  it "GET #index show a list of all users" do
    User.create(email: 'aaa@gmail.com', name: 'Mohamed Gnedy',password:'123456',role_id: 1)
    Course.create( title:'First Course')
    Course.create( title:'Second Course')
    get :index
    expect(assigns[:courses].size).to eq 2
  end
end

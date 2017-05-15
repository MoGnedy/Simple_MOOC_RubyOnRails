require "rails_helper"
RSpec.describe CoursesController, :type => :controller do
  it "GET #index show a list of all courses" do
    User.create(email: 'aaa@gmail.com', name: 'Mohamed Gnedy',password:'123456',role_id: 3)
    Course.create( title:'First Course')
    Course.create( title:'Second Course')
    get :index
    expect(assigns[:courses].size).to eq 2
  end


    describe "GET #index" do
      it "responds successfully with an HTTP 200 status code" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end


      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end


      it "loads all of the courses into @courses" do
          user1 = User.create!(name: "Mohamed Gnedy",email: 'admin@email.com', password: '123456',role_id: 3 )
          user2 = User.create!(name: "Mahmoud Gnedy",email: 'instructor@email.com', password: '123456',role_id: 2 )
        course1 = Course.create!(title: "Ruby Course", user: user1)
        course2 = Course.create!(title: "Java Course", user: user2)
        get :index

        expect(assigns(:courses)).to match_array([course1, course2])
      end
    end
  end

require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "[Action test]" do
     before do
      @user = FactoryBot.create(:user, :a)
  end
end

    context "new" do
      it "access by user" do
        sign_in @user
        get '/posts/new'
        expect(response).to be_successful
      end

      it "access by guest" do
        get '/posts/new'
        expect(response).to have_http_status(302)
      end
    end

    it "show" do
      post = Post.create(
        title: "test",
        body: "test",
        user_id: "1",
      )
      get post_path(post)
      expect(response).to be_successful
    end

    context "create" do
      it "access by user" do
        sign_in @user
        post "/posts", :params => { :post => { :title => "test", :body => "test", :user_id => 1}}
        expect(response).to have_http_status(200)
      end
      it "access by guest" do
        post "/posts"
        expect(response).to have_http_status(401)
      end
    end
  end
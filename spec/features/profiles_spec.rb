require 'rails_helper'
 
  include TestFactories
  include Warden::Test::Helpers
  Warden.test_mode!

 describe "Visiting profiles" do
 
   before do
     @user = authenticated_user
     @post = associated_post(user: @user)
     @comment = Comment.new(user: @user, post: @post,  body: "A Comment")
     comment_without_email(@comment)
   end
 
   describe "not signed in" do
 
     it "shows profile" do
       visit user_path(@user)
       expect(current_path).to eq(user_path(@user))

       expect( page ).to have_content(@user.name)
       expect( page ).to have_content(@post.title)
       expect( page ).to have_content(@comment.body)
     end
   end

   describe "sign in and visiting one's profile" do

    before do 
      login_as(@user, :scope => :user)
    end

     it "shows profile" do
       visit user_path(@user)
       expect(current_path).to eq(user_path(@user))

       expect( page ).to have_content(@user.name)
       expect( page ).to have_content(@post.title)
       expect( page ).to have_content(@comment.body)
     end

   end



 end
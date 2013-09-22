require 'spec_helper'




describe "UserPages" do
  
    def full_title(title)
      base_title = "Ruby on Rails Sample App"
      
      if title.empty?
        base_title   
      else 
        base_title + " | " + title
      end
      
    end 
    
    describe "Sign up page" do
      before {visit signup_path}
      subject{page}
      it{should have_content("Sign up") }
      it{should have_title(full_title("Sign up"))}
      
    end

    describe "Show user page" do 
      before{U2 = User.create(name: "Ali", email:"ali@ali.com", password:"workout", password_confirmation:"workout")}
      before {visit user_path(U2)}
      subject{page}
      it {should have_content(U2.name)}

    end


end

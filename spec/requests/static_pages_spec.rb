require 'spec_helper'
require 'capybara/rails'

describe "Static pages" do 
  
  let (:base_title) {"Ruby on Rails Sample App"}
  
  describe "Home page" do
     it "should have the content 'home page'" do
       visit root_path
       expect(page).to have_content('home')
     end
  end
  
  describe "about pagesss" do
    it "should have the content 'About'" do
      visit about_path
      expect(page).to have_content('About')
    end
  end
  
  describe "help page" do
    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end
  end
  
  #refactored version
  describe "company page" do
      subject {page}   
      before {visit company_path}
      it {should have_selector("h1", text:"Company")} 
      it {should have_title ("#{base_title} | Beehive")}
  end
  
  describe "contact page" do 
    it "should have the word contact" do
      visit contact_path 
      expect(page).to have_content("contact us")
      end
  end  
  
  
  #linking test
  describe "static links" do 
    it "should link properly" do
    visit root_path
    click_link "Company"
    expect(page).to have_content("Company")
    end
  end
  
  
  
end


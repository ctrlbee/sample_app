require 'spec_helper'
require 'capybara/rails'

describe "Static pages" do 
  
  let (:base_title) {"Ruby on Rails Sample App"}
  
  describe "Home page" do
     it "should have the content 'Sample App'" do
       visit '/static_pages/home'
       expect(page).to have_content('bar')
     end
  end
  
  describe "about pagesss" do
    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end
  end
  
  describe "help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
  end
  
  describe "company page" do
    it "should have the content 'company'" do
      visit '/static_pages/company'
      expect(page).to have_content('Company')
      end
      
      it "should have title 'Beehive'" do
      visit '/static_pages/company' 
      expect(page).to have_title ("#{base_title} | Beehive")
      end
      
  end
  
  
end
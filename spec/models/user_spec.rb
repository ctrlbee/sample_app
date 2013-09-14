require 'spec_helper'

describe User do
  
  before {@user = User.new(name:"anybody", email:"anybody@anybody.com", password:"foobar1", password_confirmation:"foobar1")}
  
  subject {@user}
  
    it{should respond_to(:name)}
    it{should respond_to(:email)}
    it{should respond_to(:password_digest)}
    it{should respond_to(:password)}
    it{should respond_to(:password_confirmation)}
    it{should respond_to(:authenticate)}
    it{should be_valid}
    
    describe 'negative test'do
       before {@user.name = "", @user.email=""}
      it {should_not be_valid}
    end
  
    describe 'length test' do
      before{@user.name = "a"*50}
      it{should_not be_valid}
    end
  
    describe 'email validation' do
      it 'should be valid' do
      addys = ["foo@bar.com", "user@mac.com"]
      #addys = %w[foo123@mac.com first.last@company.jp]
        addys.each do |ad|
          @user.email = ad
          expect(@user).to be_valid
        end
      end
    end
    
    
    describe 'email validation negative test' do
      it 'should not be valid' do
      addys = %w[%()##@ ab+jj()@foo.bar you@you@you]
        addys.each do |ad|
          @user.email = ad
          expect(@user).not_to be_valid
        end
      end
    end

    describe 'email uniqueness' do
        before  do
          u2 = @user.dup
          u2.email = @user.email.upcase 
          u2.save
      end

      it {should_not be_valid}

    end


  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com",
        password: " ", password_confirmation: " ")
      end
      it { should_not be_valid }
    end

    describe "when password doesn't match confirmation" do
      before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end


    describe "with a password that's too short" do
      before { @user.password = @user.password_confirmation = "a" * 5 }
      it { should be_invalid }
    end

    describe "return value of authenticate method" do
      before { @user.save }
      let(:found_user) { User.find_by(email: @user.email) }

      describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
      end

      describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end
  
end

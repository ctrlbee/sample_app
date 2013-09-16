class UsersController < ApplicationController
  def new 
  	@userNew = User.new
  	@isSubmit = params[:isSubmit]
  	render 'new'
  end

  def show 
  	@user = User.find(params[:id])
  end

  def create 
  	 @userNew = User.new(user_params)
    if @userNew.save 
      flash[:success] = "Welcome Son!"
      uid = @userNew.id
      redirect_to('/users/'+uid.to_s)
    else
      flash[:failure] = "No bueno"
      redirect_to('/users/new?isSubmit=1')
    end
  	
  end 

  private
	  def user_params
	  	params.require(:user).permit(:name, :email, :password, :password_confirmation) 
	  end


end

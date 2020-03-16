class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      flash[:success] = "Welcome to the sample app"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def updatename=
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
      
    else
      render 'edit'
    end
  end


  private

    def user_params
       # {:user => params.fetch(:user, {}).permit(:name, :email, :password, :password_confirmation)}

      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

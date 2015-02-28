class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index,:edit,:update,:show,:destroy]
  before_action :correct_user, only: [:edit,:update]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    #debugger
  end

  def create
    @test =0
    User.all.each do |u|
      if u.email == params[:user][:email]
        @test =1
      end
    end
    if @test ==0
      @user=User.new(user_params)
      @user.admin=true  if params[:admin]=="true"
      if @user.save
        UserMailer.welcome(@user).deliver_now
        flash[:success]="Successful created!"
        redirect_to root_path
      else
        render 'new'
      end
    else
      @user= User.new
      flash[:danger]="this email already registered!"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
      end
  end

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end



  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,:admin)
    end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user=User.find(params[:id])
    redirect_to(current_user) unless current_user?(@user)
  end

end

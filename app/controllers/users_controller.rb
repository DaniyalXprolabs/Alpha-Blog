class UsersController < ApplicationController

  before_action :get_user_id, only: [:show,:destroy, :edit,:update]

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      flash[:notice]="Welcome to the Alpha Blog #{@user.username}"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show

   end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User Update Successfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def get_user_id
    @user=User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end
end

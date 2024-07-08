class UsersController < ApplicationController
  skip_forgery_protection
  def index


    render json:@user
  end

  def create
    token = SecureRandom.hex
    user = User.new(user_params)
    user.token = token
    if user.save
      render json: [user,token]
    else
      render json:{message:"Somthing is wrong user not added"}
    end
  end


  def update

    if @user.update(user_params)
      # debugger
      render json:[@user,message:"user updated successfully"]
    else
      render json:{error_message:"Somthing is wrong user not updated"}
    end
  end

  def destroy
    user = @user
    if user.destroy
      render json:{message:"User deleted succefully"}
    else
      render json:{error_message:"User not deleted"}
    end
  end

  def login

    user = User.find_by(email: login_params[:email])
    if user.password == login_params[:password]
      token = SecureRandom.hex
      user.token = token
      # debugger
      user.save
      render json:[user,token]
    else
      render json:{error_message:"User not found with email or password"}
    end
  end

  def logout
    @user.token = ""
    if @user.save
      render json:{message:"User logout succesfully"}
    else
      render json:{error_message:"somthing is wrong! User is not logout"}
    end
  end


  private
  def user_params
    params.permit(:name,:password,:email)
  end
  def login_params
    params.permit(:email,:password)
  end
end

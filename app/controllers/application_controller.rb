class ApplicationController < ActionController::Base
  before_action :user_authentication!, except:[:create, :login]

  def user_authentication!
    # if (params[:controller] != 'users' && (params[:action] != 'create' || params[:action] != 'login'))
    #   render json:{message:"Please login or sign up first"}
    # debugger
    if request.headers[:token] == nil
      render json:{message:"Please give the token for use functionality "}
    else
     @user = User.find_by(token: request.headers[:token])

     if @user == nil
      render json:{erro_message:"User not found with this token"}
     end
    end
  end

end

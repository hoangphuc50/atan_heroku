class Admin::ProfilesController < ApplicationController
  before_action :signed_in_user
  layout 'admin'

  def index
  end

  def update_password
    user = User.find_by_email(current_user.email)
    if user && user.authenticate(params[:old_password])
      if params[:password].to_s.length > 5
        if params[:password].eql?(params[:password_confirmation])
          if user.update_attribute(:password,params[:password])
            flash.now[:error] = "Password Updated"
            render 'index'
          else
            flash.now[:error] = "Password Update False"
            render 'index'
          end
        else
          flash.now[:error] = "2 new password incorrect !"
          render 'index'
        end
      else
        flash.now[:error] = "Password is too short (minimum is 6 characters)"
        render 'index'
      end
    else
      flash.now[:error] = "Invalid current password"
      render 'index'
    end
  end
end

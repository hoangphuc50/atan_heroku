include SessionsHelper
class Admin::SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash.now[:error] = 'Login successfull !'
      redirect_back_or admin_users_path
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      redirect_to admin_signin_path
    end
  end
  def destroy
    sign_out
    redirect_to root_url
  end
  def lostpassword

  end
  def sendlostpassword
    user = User.find_by_email(params[:session][:email].downcase)
    if user
      Pony.mail({
                    :from =>"noreply@atansolutions.com",
                    :to => "admin@atansolutions.com",
                    :subject => "Reset password atansolutions.com",
                    :html_body => "<html><body><h1>Reset password</h1>
                            <h3>Email: #{params[:session][:email]}</h3>
                            <h3>Date: #{Date.today}</h3></body></html>",
                    :via => :smtp,
                    :via_options => {
                        :address              => 'smtp.gmail.com',
                        :port                 => '587',
                        :enable_starttls_auto => true,
                        :user_name            => 'thongtinkhachhang@gmail.com',
                        :password             => '665335665335',
                        :authentication       => :plain,
                        :domain               => "localhost.localdomain"
                    }
                })
      flash[:error] = 'Send to administrator successfull !'
      redirect_to admin_lostpassword_path
    else
      flash[:error] = 'Invalid email combination' # Not quite right!
      redirect_to admin_lostpassword_path
    end
  end
end

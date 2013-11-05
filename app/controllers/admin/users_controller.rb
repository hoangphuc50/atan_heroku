class Admin::UsersController < Admin::ApplicationController
  before_action :signed_in_user
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    #@users = User.all
  end
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @users = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
=begin
    rezzcard_user_params = User.get_rezzcard_user_params(params[:user])
    user_params = User.get_compass_user_params(params[:user])
    user_params["username"] = user_params["email"]
=end
    @users = User.new(user_params)
    if @users.save
      flash[:notice] = I18n.t('admin.users.new.success', :name => @users.email)
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @users.update(user_param)
      flash[:notice] = I18n.t('admin.users.edit.success', :name => @users.email)
      redirect_to :action => :index
    else
      #flash[:error] = I18n.t('admin.rental_units.edit.failure')
      render :action => :edit
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @users.destroy
      flash[:notice] = I18n.t('admin.users.destroy.success', :name => @users.email)
    else
      flash[:notice] = I18n.t('admin.users.destroy.failure', :name => @users.email)
    end

    redirect_to :action => :index
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @users = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  private
  def user_param
    params.require(:user).permit(:name, :email)
  end
  # Before filters

  def signed_in_user
    redirect_to admin_signin_path, notice: "Please sign in." unless signed_in?
  end
end

class Admin::DashboardController < ApplicationController
  before_action :signed_in_user
  layout 'admin'
  def index
  end
end

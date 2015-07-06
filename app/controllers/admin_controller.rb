class AdminController < ApplicationController
  http_basic_authenticate_with :name => 'login', :password => 'password'
  def index
  end
end

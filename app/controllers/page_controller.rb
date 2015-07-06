class PageController < ApplicationController


  def index
    @countries = all_countries
    @all_users = User.all

    @all_id = {}

    @all_users.each do |user|

        @all_id[user.id] = user

    end

     @current_user = @all_id[session[:user_id]]
    @user = User.new

    @country_error_class = @name_error_class = @email_error_class = ''
    @email_error_class = "error" if @user.errors[:email].count > 0
    @name_error_class = "error" if @user.errors[:name].count > 0
    @country_error_class = "errors" if @user.errors[:country].count > 0



  end

end

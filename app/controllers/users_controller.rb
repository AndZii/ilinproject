class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @country_error_class = @name_error_class = @email_error_class = ''
    @name_placeholder = "  Name"
    @email_placeholder = "  Email"

    @countries = all_countries

    respond_to do |format|
      if @user.save
       session[:user_id] = @user.id

        format.html { redirect_to page_index_path(user_params), notice: 'User was successfully created.' }
      else
        if @user.errors[:email].count > 0
          @email_placeholder = '  Invalid email!'
          @email_error_class = "error"
        end
        if  @user.errors[:name].count > 0
          @name_error_class = "error"
          @name_placeholder = "  Can not be empty!"
        end
        if @user.errors[:country].count > 0
          @country_error_class = "error"
        end
        format.html { render page_index_path }
      end
    end
  end
  def destroy_all
    users = User.all.each do |user|
      user.destroy
    end
    redirect_to root_path
  end
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :country, :email)
    end
end

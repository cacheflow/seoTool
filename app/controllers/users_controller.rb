class UsersController < ApplicationController
  def index
    @users = User.all
    @linkscape = moz
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user_id.to_s
      redirect_to user_path
    else
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
  end

  def destroy

  end

  def user_params
    params.require(:user).permit(:website, :email)
  end

end


def moz
  client = Linkscape::Client.new(:accessID => "", :secret => "")
  @response = client.urlMetrics("http://moz.com", :cols => :all)
  return @response
end
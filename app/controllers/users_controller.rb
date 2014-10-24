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
    User.delete_all
    @user = User.new(params.require(:user).permit(:website))
     @user.save
      redirect_to users_path
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private

  def moz
    @websiteurl = User.last.website
   client = Linkscape::Client.new(:accessID => "member-63b9543870", :secret => "b2e74984407f85cd3a39f6ff29fb7b08")
    @response = client.urlMetrics("http://moz.com", :cols => :all)
    puts response 
    end
  end
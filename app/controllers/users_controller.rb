class UsersController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def index
    @users = User.all
    @user = User.last
    puts api
  end

  def show
    @user = User.find(params[:id])
  end

  def new

    @user = User.new
   end
  

  def create
    User.delete_all

    @user = User.new(params.require(:user).permit(:website, :email))
    @user.save
     
    redirect_to users_path
   end

  def update
    @user = User.last  

     @user.update_attributes(params.require(:user).permit(:email))

    UserMailer.welcome_email(@user, @linkscape, @toppages, @anchorlinks, @top).deliver

  end



  def destroy

  end

    private
      def api 
      @websiteurl = User.last.website
      client = Linkscape::Client.new(:accessID => ENV["ACCESS_ID"], :secret => ENV["API_KEY"])
      @linkscape = client.urlMetrics(@websiteurl, :cols => :all)
      @toppages = client.topPages(@websiteurl, :page, :cols => :all, :limit => 5)
      @anchorlinks = client.anchorMetrics(@websiteurl, :cols => :all, :scope => "page_to_domain", :filters => :external, :sort => :domains_linking_page, :limit => 5, :scope => :phrase_to_page)
      @top = client.allLinks(@websiteurl, :urlcols => [:title, :url, :page_authority, :domain_authority], :linkcols => :all, :filters => :external, :limit => 5, :scope => :page_to_domain)
   
    end 
end
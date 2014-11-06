class UsersController < ApplicationController



  def index
   @users = User.all
    api
    respond_to do |format|
      if @users
        UserMailer.welcome_email(@user).deliver 
      end 
    end
    end 



 def api 
  @websiteurl = User.last.website
  client = Linkscape::Client.new(:accessID => ENV["ACCESS_ID"], :secret => ENV["API_KEY"])
  @linkscape = client.urlMetrics(@websiteurl, :cols => :all)
  @toppages = client.topPages(@websiteurl, :page, :cols => :all, :limit => 5)
  @anchorlinks = client.anchorMetrics(@websiteurl, :cols => :all, :scope => "page_to_domain", :filters => :external, :sort => :domains_linking_page, :limit => 5, :scope => :phrase_to_page)
  @top = client.allLinks(@websiteurl, :urlcols => [:title, :url, :page_authority, :domain_authority], :linkcols => :all, :filters => :external, :limit => 5, :scope => :page_to_domain) 
end   
  

  def show
    @users = User.find(params[:id])
  end

def new 
  @user = User.new
end 

  def create
    @user = User.new(params.require(:user).permit(:website))
    
    redirect_to users_path(@user)  
  end
 
 



  def edit
  end

  def update

  end

  def destroy

  end
  
  private 
  def user_params 
    params.require(:user).permit(:website, :email)
  end 

 
end
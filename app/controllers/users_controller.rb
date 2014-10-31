class UsersController < ApplicationController


   

  def index
    @users = User.all
    api
   end


def api
      client = Linkscape::Client.new(:accessID => ENV["ACCESS_ID"], :secret => ENV["API_KEY"])
      @linkscape = client.urlMetrics(User.last.website, :cols => :all)
      @toppages = client.topPages(User.last.website, :page, :cols => :all, :limit => 5)
      @anchorlinks = client.anchorMetrics(User.last.website, :cols => :all, :scope => "page_to_domain", :filters => :external, :sort => :domains_linking_page, :limit => 5, :scope => :phrase_to_page)
      @top = client.allLinks(User.last.website, :urlcols => [:title, :url, :page_authority, :domain_authority], :linkcols => :all, :filters => :external, :limit => 5, :scope => :page_to_domain)
  end 
 




  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  

  def create
    @user = User.new(params.require(:user).permit(:website))
    @user.save
    redirect_to users_path
    @user.destroy 
end 


  def edit
  end

  def update

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy 
  end
  
  

   
end
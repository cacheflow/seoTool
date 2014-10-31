class UsersController < ApplicationController



  def index
    @websiteurl = User.last.website
    @user = User.new
    @users = User.all
    api
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
  end
 


  def edit
  end

  def update

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
      return 
    end 



end
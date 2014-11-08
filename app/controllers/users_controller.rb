class UsersController < ApplicationController





 def api 
  @user = User.find(params[:id])
  @websiteurl = @user.website
  client = Linkscape::Client.new(:accessID => ENV["ACCESS_ID"], :secret => ENV["API_KEY"])
  @response = client.urlMetrics(@websiteurl, :cols => :all)
  @topPages = client.topPages(@websiteurl, :page, :urlcols => :all, :limit => 5)
  @anchorlinks = client.anchorMetrics(@websiteurl, :cols => :all, :scope => "page_to_domain", :filters => :external, :sort => :domains_linking_page, :limit => 5, :scope => :phrase_to_page)
  @top = client.allLinks(@websiteurl, :urlcols => [:title, :url, :page_authority, :domain_authority], :linkcols => :all, :filters => :external, :limit => 5, :scope => :page_to_domain) 
end   
  

  def show
    @users = User.find(params[:id])
    api
  end

def new 
  @user = User.new
end 

  def create
    @user = User.new(params.require(:user).permit(:website, :email))
    respond_to do |format| 
    if @user.save
      UserMailer.welcome_email(@user).deliver
      format.html {redirect_to(user_path(@user), notice: "Hold on a few seconds. We're analyzing this for you. We'll send you the results when we're done.") }
  end
end
end
 
 


  
  private 
  def user_params 
    params.require(:user).permit(:website, :email)
  end 

 
end
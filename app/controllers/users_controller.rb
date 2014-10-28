class UsersController < ApplicationController
skip_before_filter  :verify_authenticity_token
  def index

    @users = User.all
    @user = User.last
    @linkscape = moz
    @toppages = top_pages
    @anchorlinks = anchor
    @top = top_links
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
    @linkscape = moz
    @toppages = top_pages
    @anchorlinks = anchor
    @top = top_links
   end

  def update
    @user = User.last  

    respond_to do |format|
      if @user.update_attributes(params.require(:user).permit(:email))
        format.js 
      end

    end


    @linkscape = moz
    @toppages = top_pages
    @anchorlinks = anchor
    @top = top_links

    UserMailer.welcome_email(@user, @linkscape, @toppages, @anchorlinks, @top).deliver


  end

  def destroy

  end
  private
  def top_links
    
    @websiteurl = User.last.website
    client = Linkscape::Client.new(:accessID => "", :secret => "")
    @response =  client.allLinks(@websiteurl, :urlcols => [:title, :url, :page_authority, :domain_authority], :linkcols => :all, :filters => :external, :limit => 5, :scope => :page_to_domain)
    @response
  end

  def anchor
    @websiteurl = User.last.website
    client = Linkscape::Client.new(:accessID => "", :secret => "")
    @response = client.anchorMetrics(@websiteurl, :cols => :all, :scope => "page_to_domain", :filters => :external, :sort => :domains_linking_page, :limit => 5, :scope => :phrase_to_page)
    @response
  end

  def top_pages
    @websiteurl = User.last.website
    client = Linkscape::Client.new(:accessID => "", :secret => "")
    @response = client.topPages(@websiteurl, :page, :cols => :all, :limit => 5)
    @response
  end

  def moz
    @websiteurl = User.last.website
    client = Linkscape::Client.new(:accessID => "", :secret => "")
    @response = client.urlMetrics(@websiteurl, :cols => :all)
    @response
  end
end
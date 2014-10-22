class ApisController < ApplicationController
	include HTTParty



def new 
 @api = Api.new
end 

def create
	@api = Api.new
end 

  def index
  	@api = Api.all 
  end

  def destroy
  	@api = Api.find(params[:id])
  end



  def api_params 
  	params.require(:api).permit(:name)
end
end
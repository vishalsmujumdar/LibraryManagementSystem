class AuthorsController < ApplicationController
  $objJSON = ActiveSupport::JSON 

  def ajaxsearchauthors
  	@authors = Author.all

  	@authorsJSON = $objJSON.encode(@authors)

  	respond_to do |format|
  		format.json { render :json => @authorsJSON }
  	end
  end
end

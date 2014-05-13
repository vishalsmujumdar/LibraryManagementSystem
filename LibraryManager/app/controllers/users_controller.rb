class UsersController < ApplicationController
  $objJSON = ActiveSupport::JSON 

  def index
    if user_signed_in? 
        @user = User.find(current_user)
    else
        @books = Book.limit(8).order("RANDOM()")
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  def ajaxsearchusers
  	@returnhtml = ""

  	@book = Book.find(params[:bookid])
  	@path = book_bookitems_path(@book)
  	
  	if params[:bookitemid] != 'NaN'
  		@bookitem = @book.bookitems.find(params[:bookitemid])
  		@path = book_bookitem_bookissues_path(@book, @bookitem.id)
  	end

  	@name = { :value => params[:searchterm].capitalize }
	@data = params[:searchterm].capitalize
	@users = User.where(['name LIKE ?', "#{@data}%"])
	@usersJSON = $objJSON.encode(@user)
	
	@returnhtml = @users.size == 0 ? "No users match search term" : render_to_string(partial: 'userforms') 
	
	respond_to do |format|
	   format.html { render :html => @returnhtml.html_safe }
	   format.json { render :json => @usersJSON }
	end
  end
end

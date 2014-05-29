class UsersController < ApplicationController
  include BookitemsHelper

  $objJSON = ActiveSupport::JSON 

  def index
    if user_signed_in? 
        @user = User.find(current_user)
    else
        @books = Book.limit(8).order("RANDOM()")
    end
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def ajaxsearchusers
  	# initialize empty variable 'returnhtml'
    @returnhtml = ""

  	@book = Book.find(params[:bookid])

    # path used in form in partial 'users/_userforms.html.erb' can have 2 values
    # 1. to bookitems#create --> if users are searched from the 'add bookitem' button
    # 2. to bookissues#create --> if users are searched from 'issue copy button'
    
  	# path set to default value --> bookitems#create
    @path = book_bookitems_path(@book)
  	
    # if user is searched after 'book issue'
    # key 'bookitemid', sent by ajax call as json data in 'application.js' , has a value
  	if params[:bookitemid] != 'NaN'
    # if bookitemid is not equal to NaN...means path --> bookissues#create
  		@bookitem = @book.bookitems.find(params[:bookitemid])
  		@path = book_bookitem_bookissues_path(@book, @bookitem.id)
  	end

    # search USER based on search term entered...the search term is sent as hash with key 'searchterm'
    # as a json by ajax call made in 'shared/_searchuser.js.erb' partial
    @name = { :value => params[:searchterm].capitalize }
  	@data = params[:searchterm].capitalize
  	@users = User.where(['name LIKE ?', "#{@data}%"])
  	@usersJSON = $objJSON.encode(@user)
  	
    # using the above @users variable partial 'user/_userforms.html.erb' builds 
    # forms to display user templates
  	@returnhtml = @users.size == 0 ? "No users match search term" : render_to_string(partial: 'userforms') 
  	
  	respond_to do |format|
  	   format.html { render :html => @returnhtml.html_safe }
  	   format.json { render :json => @usersJSON }
  	end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :employee_id)
    end


end

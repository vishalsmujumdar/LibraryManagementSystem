class UsersController < ApplicationController
  $objJSON = ActiveSupport::JSON 

  def ajaxsearchusers
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
	
	@returnhtml = ""

	@returnhtml = render_to_string(partial: 'userforms') 
	#@users.each do |u|
	#	@returnhtml << '<div class="user" id="id_' + u.employee_id.to_s + '">'+u.name+'</div>'
	#end

	#if @user
		respond_to do |format|
		   format.html { render :html => @returnhtml.html_safe }
		   format.json { render :json => @usersJSON }
		end
	#else
	#	respond_to do |format|
	#	   format.html
	#	   format.json { render :json => @name }
	#	end
	#end

	
  end
end

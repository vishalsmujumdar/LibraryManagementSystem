module BookitemsHelper

	def create_with_new_user(user)
	 	@book = Book.find(params[:book_id])
	    @bookitem = @book.bookitems.create()
	  	@paramuser = params[:user];
	  	@user = user
	  	@bookitem.user_id = @user[:id]

	  	if @bookitem.save
	  		@book.number_of_copies ? @book.number_of_copies += 1 :  @book.number_of_copies = 1
	  		@book.save
	  		redirect_to book_path(@book), :notice => "Book item saved successfully"
	  	else
	  		render "new"
	  	end
  	end

end

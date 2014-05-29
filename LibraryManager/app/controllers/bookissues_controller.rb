class BookissuesController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource
	
	def new
		@book = Book.find(params[:book_id])
		@bookitem = @book.bookitems.find(params[:bookitem_id])
	end

	def create
		if params[:w_user]
	      @user = add_new_user(user_params)  
	    else
		  @paramuser = params[:user];
	  	  @user = User.where(["employee_id = ?", @paramuser[:employee_id].to_i]).first
  		end
    	# create bookissue object => bookitem_id, user_id
		@bookitem = Bookitem.find(params[:bookitem_id])
		@bookissue = @bookitem.bookissues.new
		@bookissue.user_id = @user[:id]

  		# set dates for issue and return
  		@bookissue.date_of_issue = Date.today
  		@bookissue.date_of_return = @bookissue.date_of_issue + 30.days

  		# set status of bookissue to true => indicating it is active
  		@bookissue.status = true

		# update bookitem availability to false
		if @bookissue.save
			@bookitem.update_attributes!(:availability => false)
			redirect_to book_path(@bookitem.book), :notice => "Book issued to #{@user.name}"
		else
			render "new"
		end
	end

	def update
		@bookissue = Bookissue.find(params[:id])
		# change status of bookissue to false => indication book is returned
		@bookissue.status = false
		# update bookitem availability to true
		@bookitem = @bookissue.bookitem
		@bookitem.update_attributes!(:availability => true)

		@bookissue.date_of_actual_return = Date.today

		if @bookissue.save
			redirect_to book_path(@bookissue.bookitem.book), :notice => "Book returned"
		else
			render :back
		end
  	end

  	private
      def user_params
        params.require(:user).permit(:name, :email, :employee_id)
      end
end

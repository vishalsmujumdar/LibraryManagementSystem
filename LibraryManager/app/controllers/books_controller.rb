require 'iconv'
class BooksController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :index, :ajaxsearchbooks]
	#load_and_authorize_resource 
	$objJSON = ActiveSupport::JSON

	def index
		@books = Book.all
	end
	def create
		@book = Book.new(book_params)

		if @book.save
			redirect_to book_path(@book)
		else
			render "new"
		end
	end
	def new
		@book = Book.new
	end
	def edit
		@book = Book.find(params[:id]) 
	end
	def show
		@book = Book.find(params[:id]) 
	end
	def update
		@book = Book.find(params[:id]) 

		if @book.update_attributes(book_params)
			redirect_to book_path(@book), :notice => "Book details edited successfully !"
		else
			render "edit"
		end
	end
	def destroy
		
	end

	def ajaxsearchbooks
		@returnhtml = ""

		@value = params[:searchterm].capitalize
		@books = Book.where(["title LIKE ?","#{@value}%"])
		#@booksJSON = $objJSON.encode(@book)
		
		@returnhtml = @books.size == 0 ? "No books match search term" : render_to_string(partial: 'bookforms')
		
		respond_to do |format|
		   format.html { render :html => @returnhtml }
		   format.json { render :json => @booksJSON }
		end
	end

	def import
		file = params[:file]
		# open the file as a ROO spreadsheet through the function open_spreadsheet
		spreadsheet = open_spreadsheet(file)
		# seperate the first row as the header
		header = spreadsheet.row(1)
		# from the second to last_row(a ROO method) 
		(2..spreadsheet.last_row).each do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			attrs = row.to_hash
		    book = Book.where(["title = ?","#{attrs[:title]}"]) || Book.new
		    book.attributes = attrs
		    book.save!
		end

	  	redirect_to books_path, notice: "Books imported."
	end

	# This creates a different object based on the format of the input file. This is taken care of by the gem ROO
	def open_spreadsheet(file)
		case File.extname(file.original_filename)
		when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
		when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
		when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
		else raise "Unknown file type: #{file.original_filename}"
		end
	end

	private
    	def book_params
        	params.require(:book).permit( :isbn, :title, :description, :category, :authors, :cover ) #:cover_file_name, :cover_content_type, :cover_file_size, :cover_updated_at)
      	end
end

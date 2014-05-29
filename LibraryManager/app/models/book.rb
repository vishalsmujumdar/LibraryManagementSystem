class Book < ActiveRecord::Base

	has_many :bookitems
	
	# paperclip options
	has_attached_file :cover, :styles => { :medium => "300x300>", :small => "200x200>", :thumb => "100x100>"}, :default_url => "/assets/book_cover_:style.png"
	# paperclip validations
	##validates_attachment_presence :cover
	validates_attachment_content_type :cover, :content_type => ["image/jpg", "image/jpeg", "image/png"]

	# validations for book
	validates :title, :authors, :category, presence: true
	validates :isbn, presence: true, numericality: true


end


# rails g model Bookitem isbn:string availability:string user:references book:references
#

class Book < ActiveRecord::Base
	has_many :bookitems
	#has_many :users, through: :bookissues

	has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_presence :cover
	validates_attachment_content_type :cover, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end


# rails g model Bookitem isbn:string availability:string user:references book:references
#
#

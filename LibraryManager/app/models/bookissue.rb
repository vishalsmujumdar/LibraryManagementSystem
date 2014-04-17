class Bookissue < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookitem
end

#rails g model Bookissue user:references bookitem:references date_of_issue:datetime date_of_return:datetime
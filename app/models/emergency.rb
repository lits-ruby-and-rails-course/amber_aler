class Emergency < ActiveRecord::Base

belongs_to :user  #for one to many

validates :title, :description, presence: true

end


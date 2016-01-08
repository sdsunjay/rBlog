class Comment < ActiveRecord::Base
  belongs_to :post
 
  
  validates :name, presence: true
  validates_length_of :name, :within => 2..20
  validates :email, presence: true
  validates :body, presence: true
end

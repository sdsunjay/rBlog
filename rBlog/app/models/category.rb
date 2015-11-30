class Category < ActiveRecord::Base
has_many :post;

validates :name, presence: true
    def self.search(query)
      where("name like ?","%#{query}%")
    end
end

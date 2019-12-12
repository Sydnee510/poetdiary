class Poem < ActiveRecord::Base 
    validates :title, :description, :content, presence: true
    belongs_to :author
end 
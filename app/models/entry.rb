class Entry < ApplicationRecord
    validates :title, presence: true, 
                      length: { minimum: 5 }
    belongs_to :activity
end

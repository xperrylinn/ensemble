class Entry < ApplicationRecord
    validates :title, presence: true, 
                      length: { minimum: 5 }
    belongs_to :activity
    has_many_attached :images
    belongs_to :entryable, polymorphic: true
end

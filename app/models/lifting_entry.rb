class LiftingEntry < ApplicationRecord
    has_one :entry, :dependent => :destroy, as: :entryable
    has_many :exercises, dependent: :delete_all
end

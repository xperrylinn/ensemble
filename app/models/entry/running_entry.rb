class RunningEntry < ApplicationRecord
    has_one :entry, :dependent => :destroy, as: :entryable
end

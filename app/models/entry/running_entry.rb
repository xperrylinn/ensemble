class RunningEntry < ApplicationRecord
    has_one :entry, as: :entryable
end

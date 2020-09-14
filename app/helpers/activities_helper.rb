module ActivitiesHelper
    def entryable_route_helper(entryable)
        case entryable
        when LiftingEntry
          lifting_entry_path(entryable.id)
        when RunningEntry
          running_entry_path(entryable.id)
        else
          welcome_index_path
        end
    end

    def edit_entryable_route_helper(entryable)
        case entryable
        when LiftingEntry
            edit_lifting_entry_path(entryable.id)
        when RunningEntry
            edit_running_entry_path(entryable.id)
        else
          welcome_index_path
        end
    end
end

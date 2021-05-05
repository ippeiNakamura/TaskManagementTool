class Task < ApplicationRecord
    belongs_to :flag,optional: true
    acts_as_nested_set
end

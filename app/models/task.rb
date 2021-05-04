class Task < ApplicationRecord
    belongs_to :flag,optional: true
end

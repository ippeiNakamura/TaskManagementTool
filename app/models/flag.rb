class Flag < ApplicationRecord
    belongs_to :work_target,optional: true
    has_many :tasks,dependent: :destroy
end

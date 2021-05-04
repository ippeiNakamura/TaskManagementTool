class Project < ApplicationRecord
    belongs_to :user,optional: true
    has_many :work_targets,dependent: :destroy
end

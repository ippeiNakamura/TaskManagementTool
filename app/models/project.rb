class Project < ApplicationRecord
    belongs_to :user,optional: true
    has_many :work_targets,dependent: :destroy
    test
    scope :set_projects, -> { where(:attibute => value)}
    # Ex:- scope :active, -> {where(:active => true)}
end

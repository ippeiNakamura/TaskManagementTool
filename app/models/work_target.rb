class WorkTarget < ApplicationRecord
    belongs_to :project,optional: true
    has_many :flags,dependent: :destroy
end

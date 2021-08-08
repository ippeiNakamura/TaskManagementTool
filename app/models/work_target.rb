class WorkTarget < ApplicationRecord
    belongs_to :project,optional: true
    has_many :flags,dependent: :destroy
    validates :name,uniqueness: {scope: :project_id,message: "作業対象は既に存在します"},presence: true,length: {maximum: 50 ,message:"%{count}文字以内で入力してください"}
end

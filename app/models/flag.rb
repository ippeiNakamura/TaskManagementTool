class Flag < ApplicationRecord
    belongs_to :work_target,optional: true
    has_many :tasks,dependent: :destroy
    validates :name,uniqueness: {scope: :work_target_id,message: "フラグは既に存在します"},presence: true,length: {maximum: 50 ,message:"%{count}文字以内で入力してください"}
end

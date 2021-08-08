class Task < ApplicationRecord
    belongs_to :flag,optional: true
    acts_as_nested_set
    validates :name,uniqueness: {scope: :flag_id,message: "タスクは既に存在します"},presence: true,length: {maximum: 50 ,message:"%{count}文字以内で入力してください"}
end

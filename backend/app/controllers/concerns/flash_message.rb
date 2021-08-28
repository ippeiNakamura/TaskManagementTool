module FlashMessage
    def save_data_message(data)
        if data.save
            redirect_to user_project_work_target_flags_path,notice:"登録できました。"
        else
            flash.now = "登録できませんでした。"
        end
    end
end
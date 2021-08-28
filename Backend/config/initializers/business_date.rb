# 2000/1/1から翌年末までの営業日を範囲とする
start_date = Time.zone.parse('2000-01-01 00:00:00')
end_date = Time.zone.now.next_year.end_of_year

# 営業日計算ライブラリの営業時間を終日に指定
BusinessTime::Config.beginning_of_workday = "00:00:00 am"
BusinessTime::Config.end_of_workday = "23:59:59 pm"

# 営業日計算ライブラリへ日本の祝祭日情報を読み込み
HolidayJp.between(start_date, end_date).each{|h| BusinessTime::Config.holidays << h.date }

require 'simplecov'
SimpleCov.start 'rails'

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

# support/config配下のファイルを読み込み
Dir[Rails.root.join("spec/support/config/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/support/helper/*.rb")].each { |f| require f }

require 'simplecov'
require 'capybara/rspec'
require 'factory_bot'
require 'shoulda-matchers'
require 'vcr'
require 'spec_helper'

# テスト実行前に未実行のmigrationファイルを検知して実行する
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # FactoryBotのメソッド使う
  config.include FactoryBot::Syntax::Methods

  # focusタグがあればそれだけ実行、なければ全spec実行
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  # ロードするfixtureのパスを指定
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # ディレクトリ構成によってspec typeを自動判別する設定
  config.infer_spec_type_from_file_location!

  # spec実行後のbacktrace表示を簡素化
  config.filter_rails_from_backtrace!

  # system specでheadless chrome使う
  config.before(:each) do |example|
    if example.metadata[:type] == :system
      driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
    end
  end
  
  # specをランダム実行
  config.order = :random

end
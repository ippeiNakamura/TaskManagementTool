require 'simplecov'

SimpleCov.start 'rails'

RSpec.configure do |config|
  # focusタグがあればそれだけ実行、なければ全spec実行
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  # specをランダム実行
  config.order = :random
end
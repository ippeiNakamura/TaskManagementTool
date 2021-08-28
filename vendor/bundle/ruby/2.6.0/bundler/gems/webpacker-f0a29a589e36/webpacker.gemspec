# -*- encoding: utf-8 -*-
# stub: webpacker 6.0.0.rc.1 ruby lib

Gem::Specification.new do |s|
  s.name = "webpacker".freeze
  s.version = "6.0.0.rc.1"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/rails/webpacker/blob/v6.0.0.rc.1/CHANGELOG.md", "source_code_uri" => "https://github.com/rails/webpacker/tree/v6.0.0.rc.1" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Heinemeier Hansson".freeze, "Gaurav Tiwari".freeze]
  s.date = "2021-08-21"
  s.email = ["david@basecamp.com".freeze, "gaurav@gauravtiwari.co.uk".freeze]
  s.files = [".eslintignore".freeze, ".eslintrc.js".freeze, ".github/workflows/jest.yml".freeze, ".github/workflows/js-lint.yml".freeze, ".github/workflows/rubocop.yml".freeze, ".github/workflows/ruby.yml".freeze, ".gitignore".freeze, ".node-version".freeze, ".rubocop.yml".freeze, "CHANGELOG.md".freeze, "CONTRIBUTING.md".freeze, "Gemfile".freeze, "Gemfile.lock".freeze, "MIT-LICENSE".freeze, "README.md".freeze, "Rakefile".freeze, "config/README.md".freeze, "config/webpacker.yml".freeze, "docs/deployment.md".freeze, "docs/developing_webpacker.md".freeze, "docs/troubleshooting.md".freeze, "docs/v6_upgrade.md".freeze, "gemfiles/Gemfile-rails-edge".freeze, "gemfiles/Gemfile-rails.5.2.x".freeze, "gemfiles/Gemfile-rails.6.0.x".freeze, "gemfiles/Gemfile-rails.6.1.x".freeze, "lib/install/bin/webpack".freeze, "lib/install/bin/webpack-dev-server".freeze, "lib/install/binstubs.rb".freeze, "lib/install/config/webpack/base.js".freeze, "lib/install/config/webpack/development.js".freeze, "lib/install/config/webpack/production.js".freeze, "lib/install/config/webpack/test.js".freeze, "lib/install/config/webpacker.yml".freeze, "lib/install/packs/entrypoints/application.js".freeze, "lib/install/template.rb".freeze, "lib/tasks/webpacker.rake".freeze, "lib/tasks/webpacker/binstubs.rake".freeze, "lib/tasks/webpacker/check_binstubs.rake".freeze, "lib/tasks/webpacker/check_node.rake".freeze, "lib/tasks/webpacker/check_yarn.rake".freeze, "lib/tasks/webpacker/clean.rake".freeze, "lib/tasks/webpacker/clobber.rake".freeze, "lib/tasks/webpacker/compile.rake".freeze, "lib/tasks/webpacker/info.rake".freeze, "lib/tasks/webpacker/install.rake".freeze, "lib/tasks/webpacker/verify_config.rake".freeze, "lib/tasks/webpacker/verify_install.rake".freeze, "lib/tasks/webpacker/yarn_install.rake".freeze, "lib/webpacker.rb".freeze, "lib/webpacker/commands.rb".freeze, "lib/webpacker/compiler.rb".freeze, "lib/webpacker/configuration.rb".freeze, "lib/webpacker/dev_server.rb".freeze, "lib/webpacker/dev_server_proxy.rb".freeze, "lib/webpacker/dev_server_runner.rb".freeze, "lib/webpacker/env.rb".freeze, "lib/webpacker/helper.rb".freeze, "lib/webpacker/instance.rb".freeze, "lib/webpacker/manifest.rb".freeze, "lib/webpacker/railtie.rb".freeze, "lib/webpacker/runner.rb".freeze, "lib/webpacker/version.rb".freeze, "lib/webpacker/webpack_runner.rb".freeze, "package.json".freeze, "package/__tests__/config.js".freeze, "package/__tests__/dev_server.js".freeze, "package/__tests__/development.js".freeze, "package/__tests__/env.js".freeze, "package/__tests__/index.js".freeze, "package/__tests__/production.js".freeze, "package/__tests__/staging.js".freeze, "package/__tests__/test.js".freeze, "package/babel/preset.js".freeze, "package/config.js".freeze, "package/configPath.js".freeze, "package/dev_server.js".freeze, "package/env.js".freeze, "package/environments/__tests__/base.js".freeze, "package/environments/base.js".freeze, "package/environments/development.js".freeze, "package/environments/production.js".freeze, "package/environments/test.js".freeze, "package/index.js".freeze, "package/inliningCss.js".freeze, "package/rules/babel.js".freeze, "package/rules/coffee.js".freeze, "package/rules/css.js".freeze, "package/rules/erb.js".freeze, "package/rules/file.js".freeze, "package/rules/index.js".freeze, "package/rules/less.js".freeze, "package/rules/raw.js".freeze, "package/rules/sass.js".freeze, "package/rules/stylus.js".freeze, "package/utils/get_style_rule.js".freeze, "package/utils/helpers.js".freeze, "test/command_test.rb".freeze, "test/compiler_test.rb".freeze, "test/configuration_test.rb".freeze, "test/dev_server_runner_test.rb".freeze, "test/dev_server_test.rb".freeze, "test/engine_rake_tasks_test.rb".freeze, "test/env_test.rb".freeze, "test/helper_test.rb".freeze, "test/manifest_test.rb".freeze, "test/mounted_app/Rakefile".freeze, "test/mounted_app/test/dummy/Rakefile".freeze, "test/mounted_app/test/dummy/bin/rails".freeze, "test/mounted_app/test/dummy/bin/rake".freeze, "test/mounted_app/test/dummy/config.ru".freeze, "test/mounted_app/test/dummy/config/application.rb".freeze, "test/mounted_app/test/dummy/config/environment.rb".freeze, "test/mounted_app/test/dummy/config/webpacker.yml".freeze, "test/mounted_app/test/dummy/package.json".freeze, "test/rake_tasks_test.rb".freeze, "test/test_app/Rakefile".freeze, "test/test_app/app/packs/entrypoints/application.js".freeze, "test/test_app/app/packs/entrypoints/multi_entry.css".freeze, "test/test_app/app/packs/entrypoints/multi_entry.js".freeze, "test/test_app/bin/webpack".freeze, "test/test_app/bin/webpack-dev-server".freeze, "test/test_app/config.ru".freeze, "test/test_app/config/application.rb".freeze, "test/test_app/config/environment.rb".freeze, "test/test_app/config/webpack/development.js".freeze, "test/test_app/config/webpacker.yml".freeze, "test/test_app/config/webpacker_other_location.yml".freeze, "test/test_app/config/webpacker_public_root.yml".freeze, "test/test_app/package.json".freeze, "test/test_app/public/packs/manifest.json".freeze, "test/test_app/some.config.js".freeze, "test/test_app/yarn.lock".freeze, "test/test_helper.rb".freeze, "test/webpack_runner_test.rb".freeze, "test/webpacker_test.rb".freeze, "webpacker.gemspec".freeze, "yarn.lock".freeze]
  s.homepage = "https://github.com/rails/webpacker".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Use webpack to manage app-like JavaScript modules in Rails".freeze
  s.test_files = ["test/command_test.rb".freeze, "test/compiler_test.rb".freeze, "test/configuration_test.rb".freeze, "test/dev_server_runner_test.rb".freeze, "test/dev_server_test.rb".freeze, "test/engine_rake_tasks_test.rb".freeze, "test/env_test.rb".freeze, "test/helper_test.rb".freeze, "test/manifest_test.rb".freeze, "test/mounted_app/Rakefile".freeze, "test/mounted_app/test/dummy/Rakefile".freeze, "test/mounted_app/test/dummy/bin/rails".freeze, "test/mounted_app/test/dummy/bin/rake".freeze, "test/mounted_app/test/dummy/config.ru".freeze, "test/mounted_app/test/dummy/config/application.rb".freeze, "test/mounted_app/test/dummy/config/environment.rb".freeze, "test/mounted_app/test/dummy/config/webpacker.yml".freeze, "test/mounted_app/test/dummy/package.json".freeze, "test/rake_tasks_test.rb".freeze, "test/test_app/Rakefile".freeze, "test/test_app/app/packs/entrypoints/application.js".freeze, "test/test_app/app/packs/entrypoints/multi_entry.css".freeze, "test/test_app/app/packs/entrypoints/multi_entry.js".freeze, "test/test_app/bin/webpack".freeze, "test/test_app/bin/webpack-dev-server".freeze, "test/test_app/config.ru".freeze, "test/test_app/config/application.rb".freeze, "test/test_app/config/environment.rb".freeze, "test/test_app/config/webpack/development.js".freeze, "test/test_app/config/webpacker.yml".freeze, "test/test_app/config/webpacker_other_location.yml".freeze, "test/test_app/config/webpacker_public_root.yml".freeze, "test/test_app/package.json".freeze, "test/test_app/public/packs/manifest.json".freeze, "test/test_app/some.config.js".freeze, "test/test_app/yarn.lock".freeze, "test/test_helper.rb".freeze, "test/webpack_runner_test.rb".freeze, "test/webpacker_test.rb".freeze]

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 5.2"])
      s.add_runtime_dependency(%q<railties>.freeze, [">= 5.2"])
      s.add_runtime_dependency(%q<rack-proxy>.freeze, [">= 0.6.1"])
      s.add_runtime_dependency(%q<semantic_range>.freeze, [">= 2.3.0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.3.0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["= 0.93.1"])
      s.add_development_dependency(%q<rubocop-performance>.freeze, [">= 0"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 5.2"])
      s.add_dependency(%q<railties>.freeze, [">= 5.2"])
      s.add_dependency(%q<rack-proxy>.freeze, [">= 0.6.1"])
      s.add_dependency(%q<semantic_range>.freeze, [">= 2.3.0"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.3.0"])
      s.add_dependency(%q<rubocop>.freeze, ["= 0.93.1"])
      s.add_dependency(%q<rubocop-performance>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 5.2"])
    s.add_dependency(%q<railties>.freeze, [">= 5.2"])
    s.add_dependency(%q<rack-proxy>.freeze, [">= 0.6.1"])
    s.add_dependency(%q<semantic_range>.freeze, [">= 2.3.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.3.0"])
    s.add_dependency(%q<rubocop>.freeze, ["= 0.93.1"])
    s.add_dependency(%q<rubocop-performance>.freeze, [">= 0"])
  end
end

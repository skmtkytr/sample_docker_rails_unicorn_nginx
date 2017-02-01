source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'mysql2'

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.3.6'
gem 'honoka-rails', '>= 3.3.6.3'
gem 'sass-rails', '~> 5.0'

# User authentication
gem 'devise',           '~> 4.2'
gem 'devise_invitable', '~> 1.7.0'
gem 'omniauth-twitter'

# Use websocket
gem 'faye-websocket', '0.10.0'
gem 'websocket-rails', github: 'moaa/websocket-rails', branch: 'sync_fixes'

# BE SLIM
gem 'slim-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '3.2.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem "font-awesome-rails"

# Use Unicorn
group :production do
  gem 'unicorn'
  gem "unicorn-rails"
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', platform: :mri

  gem "factory_girl_rails"
  gem "rspec-parameterized"
  gem "rspec-power_assert"
  gem "rspec-rails", group: :development

  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'rubocop' , require: false
  gem 'terminal-notifier-guard'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  # gem 'web-console', '>= 3.3.0'
  # gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'

  # エラー画面をわかりやすく整形してくれる
  gem 'better_errors'
  # better_errorsの画面上にirb/pry(PERL)を表示する
  gem 'binding_of_caller'

  gem "annotate"
  gem 'capistrano'
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-rbenv',   require: false
  gem 'capistrano3-unicorn'
end

group :test do
  gem 'capybara'           # ブラウザでの動作確認を自動化するときに使います
  gem 'database_cleaner'   # テストを実行するたびにデータベースをクリーンアップします
  gem 'faker'              # サンプルデータを自動的に生成してくれます(名前やメールアドレス等)
  gem 'launchy'            # テスト実行時に好きなタイミングで現在の画面表示をブラウザで開いてくれます
  gem 'selenium-webdriver' # Firefox や Chrome など、テスト対象のブラウザをカンタンに設定できます
  gem 'shoulda-matchers'   # データベースのバリデーション(名前がからの時はエラーを返すなど)をカンタンにテストできます
  gem 'simplecov', require: false # どのソースコードがテスト済みかを綺麗に表示してくれます

  gem 'rails-controller-testing', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

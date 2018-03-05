source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'

gem 'sprockets-rails', '2.3.3'

#gem 'rails_serve_static_assets'

# View and Stylish
gem 'haml-rails'
gem 'sass-rails' #, '~> 4.0.3'
gem 'simple_form'
gem 'turbolinks_transitions'

gem 'bootstrap-sass' #, '~> 3.2.0'
gem 'autoprefixer-rails'

# gem para policies
gem 'pundit'

gem 'json'
# Markdown
gem 'redcarpet'

# Configuration
gem 'figaro'

# Upload
gem 'carrierwave-aws'
gem 'mini_magick' # , :git => 'git://github.com/minimagick/minimagick.git', :ref => '6d0f8f953112cce6324a524d76c7e126ee14f392'

# I18n0

gem 'rails-i18n'
# gem 'globalize', '~> 4.0.0.alpha.2'
gem 'globalize', '~> 5.1.0.beta2'
# gem 'globalize', git: 'https://github.com/globalize/globalize'
# gem 'activemodel-serializers-xml'
#gem 'globalize' #, '~> 5.0.0'

# Friendly URL's
gem 'friendly_id', '~> 5.1.0' # '~> 5.0.0'

gem 'uglifier' #, '>= 1.3.0'
gem 'coffee-rails' #, '~> 4.0.0'
gem 'jquery-rails'

# bcrypt para criptografar senhas de usuarios
gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'

group :production do
  gem 'pg' , '~> 0.18.0'
end

group :development, :test do
  gem 'sqlite3'
  gem 'thin'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


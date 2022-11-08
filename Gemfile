ruby '3.1.2'
source 'http://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 6.1'
gem 'slim-rails'

gem 'sqlite3'

gem 'sprockets'
gem 'sass-rails'
gem 'coffee-rails'
gem 'autoprefixer-rails'
gem 'uglifier'

gem 'puma'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console'
  gem 'listen'
end

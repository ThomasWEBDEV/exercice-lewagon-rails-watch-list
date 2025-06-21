# Gemfile

source "https://rubygems.org"

gem "rails", "~> 8.0.2"

# Retirer ou commenter cette ligne pour désactiver Propshaft
# gem "propshaft" # <--- COMMENTEZ OU SUPPRIMEZ CETTE LIGNE

gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "solid_cache"
gem 'solid_queue', '~> 0.3.0'
gem "solid_cable"

gem "bootsnap", require: false

gem "kamal", require: false
gem "thruster", require: false

# --- SASS & STYLING STACK UPDATES ---
# S'assurer que 'sass-rails' est bien là et pas 'sassc-rails'
gem "sass-rails" # Ceci utilise Dart Sass (sass-embedded)

# Mettre à jour Bootstrap pour une meilleure compatibilité avec Dart Sass et Rails 8
gem "bootstrap", "~> 5.3", ">= 5.3.3"

# Font Awesome
gem "font-awesome-sass", "~> 6.1"

gem "simple_form"
# --- FIN SASS & STYLING STACK UPDATES ---

gem "autoprefixer-rails" # Utile même en production pour les préfixes vendeurs
gem 'cloudinary'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem 'dotenv-rails'
end

group :development do
  gem "web-console"
end

group :production do
  gem 'pg', '~> 1.1'
end

group :test do
  gem 'rspec-rails'
  gem 'rails-controller-testing'
end

gem 'rails_12factor', group: :production

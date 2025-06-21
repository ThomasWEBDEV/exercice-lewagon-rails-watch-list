# config/application.rb

require_relative "boot"

# Assurez-vous que Sprockets est bien requis ici
require "rails/all"
require "sprockets/railtie" # <--- AJOUTEZ/ASSUREZ-VOUS DE CETTE LIGNE

Bundler.require(*Rails.groups)

module YourAppName # Remplacez par le nom de votre application
  class Application < Rails::Application
    config.load_defaults 8.0

    # Activer le pipeline d'assets de Sprockets
    config.assets.enabled = true

    # Ajouter les chemins où Sprockets doit chercher les assets
    config.assets.paths << Rails.root.join("app", "assets", "stylesheets")
    config.assets.paths << Rails.root.join("app", "assets", "javascripts")
    config.assets.paths << Rails.root.join("app", "assets", "images")
    config.assets.paths << Rails.root.join("app", "assets", "fonts") # Si vous avez des fonts

    # Précompiler les assets supplémentaires si nécessaire (e.g., des images spécifiques)
    # config.assets.precompile += %w( application.js application.css ) # Décommenter si vous avez des fichiers spécifiques à précompiler en dehors du manifeste

    # Désactiver Propshaft pour éviter les conflits (Rails 8 tente de l'activer par défaut si la gem est présente)
    # Même si la gem est retirée, cette ligne peut aider à être explicite
    config.assets.configure do |env|
      env.unregister_processor "text/css", Sprockets::PropshaftProcessor if defined?(Sprockets::PropshaftProcessor)
    end

  end
end

module Submariner
  class Railtie < Rails::Railtie
    initializer "submariner.insert_middleware" do |app|
      app.config.middleware.use "Rack::WildCardSubdomains"
    end
  end
end

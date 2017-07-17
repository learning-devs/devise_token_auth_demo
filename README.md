# Devise Token Auth Demo

### Para propositos de aprendizaje.


Instalamos las gemas:
~~~ruby
gem 'devise_token_auth'
gem 'omniauth'
~~~

Creamos la base de datos:
~~~ruby
rails db:create
~~~

Corremos el comando:
~~~ruby
rails g devise_token_auth:install User auth
~~~

Migramos:
~~~ruby
rails db:migrate
~~~

Si el API y el cliente van a estar en diferentes dominios, debes configurar tu aplicación para que acepte  cross origin requests:

Asegurate de permitir solo los dominios que tendran acceso al API.
~~~ruby
# gemfile
gem 'rack-cors', :require => 'rack/cors'

# config/application.rb
module YourApp
  class Application < Rails::Application
    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*',
          :headers => :any,
          :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
          :methods => [:get, :post, :options, :delete, :put]
      end
    end
  end
end
~~~

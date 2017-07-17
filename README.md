# Devise Token Auth Demo

### Para propositos de aprendizaje.

---

Instalamos las gemas:
```
gem 'devise_token_auth'
gem 'omniauth'
```

Creamos la base de datos:
```
rails db:create
```

Corremos el comando:
```
rails g devise_token_auth:install User auth
```

Migramos:
```
rails db:migrate
```

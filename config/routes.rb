Rails.application.routes.draw do
  post 'sessions/login'
  post 'sessions/register'
  delete 'sessions/logout'
end

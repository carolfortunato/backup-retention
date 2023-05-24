Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'snapshots/should_retain'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'snapshots/should_retain', to: 'snapshots#should_retain'
    end
  end
end

ActionController::Routing::Routes.draw do |map|

	map.root :controller => 'home', :action => 'index'
	map.resources :boards,	:member => { :add_magnet => :put }
	map.resources :magnets, :member => { :update_position => :put }
	map.signup '/signup', :controller => 'users',		:action => 'new'
	map.login	'/login',	:controller => 'sessions', :action => 'new'
	map.logout '/logout', :controller => 'sessions', :action => 'destroy'
	map.activate '/activate/:id', :controller => 'accounts', :action => 'show'
	map.forgot_password '/forgot_password',		:controller => 'passwords', :action => 'new'
	map.reset_password	'/reset_password/:id', :controller => 'passwords', :action => 'edit'
	map.change_password '/change_password',		:controller => 'accounts',	:action => 'edit'
	
	# See how all your routes lay out with "rake routes"
	map.resources :pages, :member => { 
		:show_position => :get, 
		:move_higher => :put, 
		:move_lower => :put 
	}

	map.resources :users, :member => { :enable => :put } do |user|
		user.resource :account
		user.resources :roles
	end
	
	map.resource :session
	map.resource :password
	map.resource :message
	
end

Rails.application.routes.draw do

    scope PluginRoutes.system_info["relative_url_root"] do
      #Admin Panel
      scope 'admin', as: 'admin' do
        namespace 'plugins' do
          namespace 'camaleon_post_order' do
            post 'reorder_posts' => "admin#reorder_posts"
            get 'settings' => "admin#settings"
            post 'settings' => "admin#save_settings"
          end
        end
      end
    end
  end

module Plugins::CamaleonPostOrder::MainHelper
  def self.included(klass)
    # klass.helper_method [:my_helper_method] rescue "" # here your methods accessible from views
  end

  # get the plugin name with slug: 'camaleon_post_order'
  def get_plugin
    plugin = current_site.plugins.find_by_slug("camaleon_post_order")
  end

  def camaleon_post_order_on_destroy(plugin)

  end

  # here all actions on going to active
  # you can run sql commands like this:
  # results = ActiveRecord::Base.connection.execute(query);
  # plugin: plugin model
  def camaleon_post_order_on_active(plugin)

  end

  # here all actions on going to inactive
  # plugin: plugin model
  def camaleon_post_order_on_inactive(plugin)

  end

  # This adds a javascript to rearrange the elements of any type of content
  def camaleon_post_order_on_list_post(values)

    plugin_meta = get_plugin.get_meta('_reorder_objects')

    if plugin_meta.present?
      plugin_meta[:post_type].each do |meta|
        if meta.to_i == values[:post_type].id.to_i
          append_asset_libraries({reorder: {js: [plugin_asset_path("post_reorder.js")], css: [plugin_asset_path("reorder.css")]}})
          cama_content_append('<script>jQuery(function(){$.fn.reorder({url: "'+admin_plugins_camaleon_post_order_reorder_posts_path+'", table: "#posts-table-list"});});</script>')
        end
      end
    end
  end

  # This will add link options for this plugin.
  def camaleon_post_order_plugin_options(arg)
    arg[:links] << link_to(t('plugin.post_reorder.settings'), admin_plugins_camaleon_post_order_settings_path)
  end

  # here all actions to upgrade for a new version
  # plugin: plugin model
  def camaleon_post_order_on_upgrade(plugin)
  end
end

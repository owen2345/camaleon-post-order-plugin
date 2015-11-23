class Plugins::CamaleonPostOrder::AdminController < CamaleonCms::Apps::PluginsAdminController
  include Plugins::CamaleonPostOrder::MainHelper
  # This updates the position of the elements in the database.
  def reorder_posts
    if params[:values].present?
      params[:values].each_with_index do |value,index |
        post = current_site.posts.find(value).update_column("post_order", index)
        # taxonomy_id = post.post_type.id
        # post.term_relationships.where("term_taxonomy_id = ?", taxonomy_id).first.update_column("term_order", index)
      end
    end

    render inline: "correct"
  end

  # show plugin settings.
  def settings

  end

  # This saves the settings plugin.
  def save_settings
    @plugin = current_plugin
    @plugin.set_meta("_reorder_objects", params[:object] || {})
    flash[:notice] = "#{t('plugin.post_reorder.updated_changes')}"

    redirect_to action: :settings
  end
end

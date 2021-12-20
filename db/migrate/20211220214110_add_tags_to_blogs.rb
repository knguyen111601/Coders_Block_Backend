class AddTagsToBlogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogs, :tags
    add_column :blogs, :tags, :string, array: true, default: []
  end
end

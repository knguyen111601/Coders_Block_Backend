class AddTagsToBlogs < ActiveRecord::Migration[7.0]
  def change
    change_column :blogs, :tags, :string, array: true, default: []
  end
end

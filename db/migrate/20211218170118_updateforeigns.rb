class Updateforeigns < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :paragraphs, :blogs
    add_foreign_key :paragraphs, :blogs, on_delete: :cascade
    remove_foreign_key :images, :blogs
    add_foreign_key :images, :blogs, on_delete: :cascade
  end
end

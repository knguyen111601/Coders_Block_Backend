class CreateParagraphs < ActiveRecord::Migration[7.0]
  def change
    create_table :paragraphs do |t|
      t.string :heading
      t.text :content
      t.text :subtext
      t.integer :order
      t.references :blog, foreign_key: true, on_delete: :cascade
      t.timestamps
    end
  end
end

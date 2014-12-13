class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.string :title
      t.text :content
      t.text :metaphor
      t.date :published_at
      t.integer :author_id

      t.timestamps
    end
  end
end

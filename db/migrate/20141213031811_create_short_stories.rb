class CreateShortStories < ActiveRecord::Migration
  def change
    create_table :short_stories do |t|
      t.string :title
      t.text :content
      t.text :description
      t.date :published_at
      t.integer :author_id

      t.timestamps
    end
  end
end

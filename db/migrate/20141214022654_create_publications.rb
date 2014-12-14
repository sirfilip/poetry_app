class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :type
      t.string :title
      t.text :content
      t.text :description
      t.date :published_at
      t.integer :author_id, index: true

      t.timestamps
    end
  end
end

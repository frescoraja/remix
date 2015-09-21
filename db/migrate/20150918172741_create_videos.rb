class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.string :media_url, null:false
      t.text :description, null: false
      t.text :tags, array: true, default: []
      t.timestamps
    end

    add_index :videos, :title
    add_index :videos, :description
  end
end

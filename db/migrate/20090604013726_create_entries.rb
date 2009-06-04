class CreateEntries < ActiveRecord::Migration
  def self.up

    create_table :entries do |t|
      t.integer :user_id, :null => false
      t.string :title, :null => false
      t.text :description, :null => false
      t.string :cached_tag_list
      t.timestamps
    end

    add_index :entries, :user_id
    add_index :entries, :title

  end

  def self.down
    drop_table :entries
  end
end

class ActsAsTaggableMigration < ActiveRecord::Migration
  def self.up
    #make all indexable fields not null on database to improve indexing
    create_table :tags do |t|
      t.string :name, :null => false
      t.timestamps
    end

    add_index :tags, :name, :unique => true

    create_table :taggings do |t|
      t.integer :tag_id, :null => false
      t.integer :taggable_id, :null => false
      t.string :taggable_type, :limit => 40, :null => false
      
      t.timestamps
    end
    
    add_index :taggings, :tag_id
    add_index :taggings, [:taggable_id, :taggable_type]
  end
  
  def self.down
    drop_table :taggings
    drop_table :tags
  end
end

class CreateFollowerRelationships < ActiveRecord::Migration
  def change
    create_table :follower_relationships do |t|
      t.references :follower
      t.references :followee

      t.timestamps
    end
  end
end

class CreateDailies < ActiveRecord::Migration
  def self.up
    create_table :dailies do |t|
      t.string :name
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :item_id
      t.timestamps
    end
  end

  def self.down
    drop_table :dailies
  end
end

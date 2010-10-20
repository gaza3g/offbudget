class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string  :name
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :budget_id
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end

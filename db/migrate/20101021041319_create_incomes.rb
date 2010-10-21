class CreateIncomes < ActiveRecord::Migration
  def self.up
    create_table :incomes do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :incomes
  end
end

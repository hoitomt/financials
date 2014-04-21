class CreateTransactionTags < ActiveRecord::Migration
  def change
    create_table :transaction_tags do |t|
      t.integer :transaction_id
      t.integer :tag_id

      t.timestamps
    end
  end
end

class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.datetime :transaction_date
      t.decimal :amount
      t.string :description
      t.string :identifier

      t.timestamps
    end
  end
end

class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.string :transaction_date
      t.string :payment_date
      t.string :description
      t.float :amount

      t.timestamps
    end
  end
end

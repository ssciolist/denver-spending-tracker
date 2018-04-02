class CreateProgramVendorPurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :program_vendor_purchases do |t|
      t.references :vendor, foreign_key: true
      t.references :program, foreign_key: true
      t.references :purchase, foreign_key: true
    end
  end
end

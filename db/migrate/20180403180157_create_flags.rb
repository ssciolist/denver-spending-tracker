class CreateFlags < ActiveRecord::Migration[5.1]
  def change
    create_table :flags do |t|
      t.references :user, foreign_key: true
      t.references :purchase, foreign_key: true

      t.timestamps
    end
  end
end

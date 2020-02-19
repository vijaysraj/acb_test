class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.string :reference
      t.integer :amount
      t.string :collection_date
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end

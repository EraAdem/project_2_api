class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :place
      t.date :date
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

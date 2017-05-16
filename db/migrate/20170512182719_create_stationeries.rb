class CreateStationeries < ActiveRecord::Migration[5.0]
  def change
    create_table :stationeries do |t|
      t.string :article
      t.string :description
      t.integer :quantity
      t.timestamps
    end
  end
end

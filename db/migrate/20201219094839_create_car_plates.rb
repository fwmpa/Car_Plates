class CreateCarPlates < ActiveRecord::Migration[6.0]
  def change
    create_table :car_plates, { id: false } do |t|
      t.string :plate, primary_key: true
      t.string :owner
      t.string :model
      t.integer :year

      t.timestamps
    end
  end
end

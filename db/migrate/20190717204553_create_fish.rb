class CreateFish < ActiveRecord::Migration[5.2]
  def change
    create_table :fish do |t|
      t.string :name
      t.text :information
      t.text :facts
      t.text :habitat
      t.text :diet
      t.text :tips

      t.timestamps
    end
  end
end

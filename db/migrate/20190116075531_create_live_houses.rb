class CreateLiveHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :live_houses do |t|
      t.string  :name
      t.string  :prefecture
      t.string  :address
      t.string  :phone_number
      t.text    :hp_url
      t.text    :detail
      t.text    :image_id
      t.integer :capacity
      t.boolean :enable, default: true, null: false

      t.timestamps
    end
  end
end

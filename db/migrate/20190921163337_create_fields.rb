class CreateFields < ActiveRecord::Migration[6.0]
  def change
    create_table :fields do |t|
      t.string :name
      t.integer :lessons_count, null: false, default: 0

      t.timestamps
    end
  end
end

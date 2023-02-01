class CreateDisplayables < ActiveRecord::Migration[7.0]
  def change
    create_table :displayables do |t|
      t.string :name
      t.string :color
      t.boolean :flatshading

      t.timestamps
    end
  end
end

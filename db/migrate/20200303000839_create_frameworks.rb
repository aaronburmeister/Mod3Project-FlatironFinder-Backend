class CreateFrameworks < ActiveRecord::Migration[6.0]
  def change
    create_table :frameworks do |t|
      t.string :name
      t.string :icon_url
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateUserFrameworks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_frameworks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :framework, null: false, foreign_key: true

      t.timestamps
    end
  end
end

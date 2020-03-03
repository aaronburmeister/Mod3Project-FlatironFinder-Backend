class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :email
      t.string :cohort
      t.string :campus
      t.string :github
      t.string :linkedin
      t.string :blog

      t.timestamps
    end
  end
end

class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :gender
      t.integer :birth_year
      t.string :first_name
      t.string :last_name
      t.references :user, index: { unique: true },foreign_key: true

      t.timestamps
    end
  end
end

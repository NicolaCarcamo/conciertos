class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :member
      t.date :debutdate
      t.string :type

      t.timestamps
    end
  end
end

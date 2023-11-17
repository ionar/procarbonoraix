class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :city
      t.string :province
      t.string :profile
      t.boolean :agree

      t.timestamps
    end
  end
end

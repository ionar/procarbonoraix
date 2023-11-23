class CreateResgates < ActiveRecord::Migration[7.1]
  def change
    create_table :resgates do |t|
      t.string :nome
      t.string :email
      t.string :phone
      t.string :chave
      t.string :cpfcnpj
      t.boolean :agree
      t.boolean :privacidade

      t.timestamps
    end
  end
end

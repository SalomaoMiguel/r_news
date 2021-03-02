class CreateUserRegistro < ActiveRecord::Migration[5.2]
  def change
    create_table :user_registro do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nome
      t.string :email
      t.string :navegador
      t.string :so

      t.timestamps
    end
  end
end

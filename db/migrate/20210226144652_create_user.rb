class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :user do |t|
      t.string :nome, null: false
      t.string :email, null: false
      t.string :senha, null: false
      t.boolean :ativo, null: false, default: true
      t.boolean :master, null: false, default: false
      t.boolean :admin, null: false, default: false
      t.boolean :idioma, null: false, default: true

      t.timestamps
    end
  end
end

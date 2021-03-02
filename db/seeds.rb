# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#criar usuario master unico direto pelo seed
@usuario = User.where(master: true).first
unless @usuario
  User.create( nome: 'User_master', email: 'salomaombono@gmail.com', senha:'1234', admin: true, ativo: true, master: true, idioma: true)
end

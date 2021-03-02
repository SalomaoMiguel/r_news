class User < ApplicationRecord
  #Relacionamento
  has_many :user_registros
  #Validacao
  validates :nome, presence: true, length: {maximum: 255}
  validates :email, format: { multiline: true,  with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, presence: true, uniqueness: true
  validates :senha , length: {minimum: 3}
  validates :ativo, :master, :admin, :idioma , inclusion: { in: [ true, false ] }
  #Metodo de classe
  #Metodo para deixar o email em letras minusculas
  before_save { self.email = email.downcase unless self.email.blank? }
  before_save :crypt_senha
  # Criptografar senha de usuario
  def crypt_senha
    write_attribute("senha", self.class.sha1(self.senha)) if (!self.senha.blank? and !self.senha.nil?) and (self.senha.length < 30 && self.senha.length > 0)
  end

  def self.autenticacao(email, token)
    user = User.where(ativo: true, email: email).first
    return false unless user
    return false if sha1(token) != user.senha
    user
  end

  protected
  #Criando Criptografia autografada
  def self.sha1(token)
    Digest::SHA1.hexdigest("G2NewsCruz" + token)
  end

end

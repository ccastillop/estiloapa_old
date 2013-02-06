class User < ActiveRecord::Base
  validates_presence_of :nombre
  has_many :documentos
  has_and_belongs_to_many :asignaciones, :class_name => "Documento" 
  acts_as_authentic do |c|
    c.login_field = :email
  end
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    UserMailer.deliver_password_reset_instructions(self)
  end
  
  def to_s
    nombre
  end
  
end

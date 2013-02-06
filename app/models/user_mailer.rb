class UserMailer < ActionMailer::Base

  default_url_options[:host] = HOST2

  def password_reset_instructions(user)
    setup_email(user)
    subject       "Restaurar la clave"
    body[:edit_password_reset_url] = edit_password_reset_url(user.perishable_token)
  end

  def confirm_email_instructions(user)
    setup_email(user)
    subject       "Confirmar registro"
    body[:edit_confirm_email_url] = edit_confirm_email_url(user.perishable_token)
  end
   
  def gracias(user)
    setup_email(user)
    subject     "#{subject} Gracias por Registrarte en #{HOST}"
    # email.set_content_type "text/html"
    body[:url] = "#{HOST}"
  end

  protected
    def setup_email(user)
      recipients  "#{user.email}"
      from        "EstiloAPA <contacto@estiloapa.com>"
      reply_to    "ccastillo@estiloapa.com"
      subject     "[EstiloAPA] "
      sent_on     Time.now
      body[:user] = user
    end
end

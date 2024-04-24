class ContactsController < ApplicationController
  # Используется для обработки формы обратной связи или контактной формы. Этот контроллер может обрабатывать отправку
  # формы и выполнять действия, например, отправку письма владельцу или сохранение данных в базе данных.
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactMailer.contact_notification(@contact).deliver_now
      redirect_to root_path, notice: 'Thank you for your message!'
    else
      flash[:alert] = 'Oops, something went wrong. Please try again.'
      redirect_to root_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end

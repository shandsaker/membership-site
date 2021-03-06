class ContactUsPage < SimpleDelegator
  def visit
    super("/contact-us")
  end

  def enter_name(name)
    fill_in "contact_form[full_name]", with: name
  end

  def enter_email(email)
    fill_in "contact_form[email]", with: email
  end

  def enter_subject(subject)
    fill_in "contact_form[subject]", with: subject
  end

  def enter_message(message)
    fill_in "contact_form[message]", with: message
  end

  def submit_message
    click_on "Send"
  end
end

class CompanyMailer < ActionMailer::Base
  default from: "webmaster@newworkaustin.com"

  def new_company_email(company)
    @admins = Admin.all
    @company = company
    @url = "http://www.newworkaustin.com/nwa/companies/" + company.id.to_s
    @admins.each do |admin|
      mail(:to => admin.email, :subject => "New Company Signup").deliver
    end
  end

  def new_contact_email(name, email, message)
    @admins = Admin.all
    @message = message

    address = Mail::Address.new email
    address.display_name = name

    @admins.each do |admin|
      mail(:to => admin.email, :from => address.format, :subject => "New Work Website Contact Message").deliver
    end
  end

end

class CompanyMailer < ActionMailer::Base
  default from: "webmaster@newworkaustin.com"

  def new_company_email(company)
    @admins = Admin.all
    @company = company
    @url = "http://www.newworkaustin.com/companies/" + company.id.to_s
    @admins.each do |admin|
      mail(:to => admin.email, :subject => "New Company Signup")
    end
  end
end

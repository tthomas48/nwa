class CompanyUrl < ActiveRecord::Base
  validate :url, :presence => true
  belongs_to :company, :foreign_key => "company_id"
end

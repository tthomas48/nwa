class Company < ActiveRecord::Base
  has_attached_file :logo, :styles => { :medium => "270x150>", :thumb => "135x75>" }
  has_many :company_url
  validates :name, :presence => true
  validates :description, :presence => true

  accepts_nested_attributes_for :company_url, :allow_destroy => true
end

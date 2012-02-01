class Company < ActiveRecord::Base

  LOGO_SW = 55
  LOGO_SH = 55
  LOGO_NW = 240
  LOGO_NH = 240

  has_attached_file :logo, 
        :styles => { :normal => ["#{LOGO_NW}x#{LOGO_NH}>", :jpg],
                     :small => ["#{LOGO_SW}x#{LOGO_SH}#", :jpg] },
                    :processors => [:jcropper],
                    :default_url => "/images/default_logo.png"

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_logo, :if => :cropping?

  has_many :company_url
  validates :name, :presence => true
  validates :description, :presence => true

  accepts_nested_attributes_for :company_url, :allow_destroy => true

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  # helper method used by the cropper view to get the real image geometry
  def logo_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file logo.path(style)
  end

  private

  def reprocess_logo
    logo.reprocess!
  end
end

class Profile < ActiveRecord::Base
  has_attached_file :avatar, styles: { thumb: ["64x64#", :jpg],
                                       original: ['600x600>', :jpg] },
                    convert_options: { thumb: "-quality 75 -strip",
                                       original: "-quality 85 -strip" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  belongs_to :user
end

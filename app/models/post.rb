class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  acts_as_taggable
  acts_as_votable
  has_attached_file :avatar, styles: { thumb: ["200x200#", :jpg],
                                       original: ['800x800>', :jpg] },
                    convert_options: { thumb: "-quality 75 -strip",
                                       original: "-quality 85 -strip" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  paginates_per 5
end

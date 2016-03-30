class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, presence: {message:'Veuillez renseigner un titre pour votre publication'}
  validates :tag_list, presence: {message:'Veuillez ajouter au moins un tag à votre publication '}
  acts_as_taggable
  acts_as_votable
  has_attached_file :avatar, styles: { thumb: ["200x200#", :jpg],
                                       original: ['800x800>', :jpg] },
                    convert_options: { thumb: "-quality 75 -strip",
                                       original: "-quality 85 -strip" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  paginates_per 5
  validates_attachment :avatar, presence: {message:'Les publications sans photographie n\'existent pas chez nous.'},
                       content_type: { content_type: ["image/jpeg","image/png"] }
  include SearchCop

  search_scope :search do
    attributes :title, :text
    attributes :tags => ["tags.name"]
  end
end

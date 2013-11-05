class Article < ActiveRecord::Base
  belongs_to :category
  has_many :article_languages
  belongs_to :user
  has_many :languages, :through => :article_languages
  validates :name, presence: true   , length: { maximum: 50 }
end

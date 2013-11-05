class ArticleLanguage < ActiveRecord::Base
  belongs_to :article
  belongs_to :language
  validates :title, presence: true   , length: { maximum: 50 }
end

class CategoryLanguage < ActiveRecord::Base
  belongs_to :category
  belongs_to :language
  validates :title, presence: true   , length: { maximum: 50 }
  validates :language_id, presence: true
  validates :category_id, presence: true
end

class Blog < ApplicationRecord
  #Enumeration for status of blogs. Stored as 1 and 0 but really represents draft and published
  enum status: { draft: 0, published: 1 }

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body
end

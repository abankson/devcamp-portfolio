class Portfolio < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :mainImage, :thumbImage

  #Custom Query accessible via Portfolio.angular
  def self.angular
    where(subtitle: 'Angular 2')
  end

  #Essentially the same thing as above, but using scope keyword
  #scope :angular_portfolio_items, -> { where(subtitle: 'Angular 2') }

end

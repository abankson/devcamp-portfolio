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

  after_initialize :set_defaults

  def set_defaults
    # '||=' means 
    self.mainImage ||= "http://via.placeholder.com/700x400"
    self.thumbImage ||= "http://via.placeholder.com/350x200"
  end

end

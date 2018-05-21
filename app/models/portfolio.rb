class Portfolio < ApplicationRecord
  has_many :technologies

  include Placeholder

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
    # '||=' is essentially an if nil then set to ... statement
    self.mainImage ||= Placeholder.imageGenerator(height: '700', width: '400')
    self.thumbImage ||= Placeholder.imageGenerator(height: '350', width: '200')
  end

end

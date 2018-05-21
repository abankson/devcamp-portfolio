class Portfolio < ApplicationRecord
  has_many :technologies

  #So you can pull in technology attributes and reject if no technologies
  #You can build with this kind of code with an array of technology items
  # => Portfolio.create!(title: "Web App", subtitle: "asdasd", body: "asdjnkjng", technologies_attributes: [{name: "Ruby"}, 
  #     {name: "Rails"}, {name: "Angular"}, {name: "Ionic"}])
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda { |attrs| attrs['name'].blank? }

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

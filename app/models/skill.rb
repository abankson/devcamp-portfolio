class Skill < ApplicationRecord
  include Placeholder

  validates_presence_of :title, :percentUtilized

  after_initialize :set_defaults

  def set_defaults
    # '||=' is essentially an if nil then set to ... statement
    self.badge ||= Placeholder.imageGenerator(height: '150', width: '150')
  end
end

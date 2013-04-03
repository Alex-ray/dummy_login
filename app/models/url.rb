require 'uri'
class Url < ActiveRecord::Base
  validates_format_of :url, :on => :create, :with => URI::regexp(%w(http https))
end

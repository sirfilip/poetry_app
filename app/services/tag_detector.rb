require 'set'

class TagDetector 

  attr_reader :tags

  def initialize
    @tags = Tag.pluck(:name).map { |t| t.downcase }.to_set
  end

  def detect(text)
    words = text.downcase.split(/\W/).to_set
    tags & words
  end

end
class Publication < ActiveRecord::Base
  belongs_to :author, :inverse_of => :publications

  def self.latest 
    order("published_at desc").limit(10)
  end

end

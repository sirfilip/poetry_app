FactoryGirl.define do

  factory :short_story do
    title "The Story"
    content "My Awesome New Story..."
    description "Short Description"
    published_at { Date.today }
    author
  end

end

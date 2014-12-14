FactoryGirl.define do
  factory :publication do
    type ""
    title "MyString"
    content "MyText"
    description "MyText"
    published_at { Date.today }
    author
  end

  factory :poem, :parent => :publication, :class => 'Poem' do 
    type "Poem"
  end

  factory :short_story, :parent => :publication, :class => 'ShortStory' do 
    type "ShortStory"
  end

end

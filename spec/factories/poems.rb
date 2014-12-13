FactoryGirl.define do
  factory :poem do
    title "What a wonderful world"
    content "La la la la..."
    metaphor "Live is good"
    published_at { Date.today }
    author
  end

end

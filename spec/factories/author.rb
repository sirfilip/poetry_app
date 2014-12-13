FactoryGirl.define do 

  factory :author do 
    sequence :name do |n| 
      "Author#{n}"
    end
    biography "Born in the usa"
  end


end

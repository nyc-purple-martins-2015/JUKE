FactoryGirl.define do
  factory :vote do
    association :user
    association :setlist_song

    factory :upvote do
      value 1
    end

    factory :downvote do
      value -1
    end
  end

end

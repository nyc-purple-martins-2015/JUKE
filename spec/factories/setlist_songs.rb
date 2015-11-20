FactoryGirl.define do
  factory :setlist_song do
    association :song
    association :setlist
  end

end

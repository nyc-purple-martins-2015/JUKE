FactoryGirl.define do
  factory :guest_setlist do
    association :guest, factory: :user
    association :setlist
  end

end

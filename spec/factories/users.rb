FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "user_#{n}"}
    sequence(:email) {|n| "email#{n}@gmail.com"}
    password "password"
  end

end

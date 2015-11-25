FactoryGirl.define do
  factory :setlist do
    association :host, factory: :user
    name {Faker::Name.title}
    spotify_url {Faker::Internet.url('spotify.com')}
    invite_code "a1b2c3"
  end

end

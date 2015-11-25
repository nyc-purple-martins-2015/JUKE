FactoryGirl.define do
  factory :song do
    title {Faker::Name.title}
    artist {Faker::Name.name}
    album {Faker::Name.title}
    spotify_url {Faker::Internet.url('spotify.com')}
  end

end

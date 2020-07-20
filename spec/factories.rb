FactoryBot.define do
  factory :user do
    email {"test@gmail.com"}
    password {"123456"}
  end

  factory :movie do
    user
    title { Faker::Movie.quote }
    embed_code {'<iframe src="//www.youtube.com/embed/3mMzr0Rc94c" frameborder="0" allowfullscreen="allowfullscreen"></iframe>'}
    url { Faker::Internet.url }
  end
end
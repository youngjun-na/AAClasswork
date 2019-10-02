FactoryBot.define do
  factory :user do
    username {Faker::Dessert.variety}
    password {"password"}
  end
end

FactoryBot.define do
  factory :user do
    email {'mia@example.com'}
    password {'password'}
  end

  factory :admin, parent: :user do
    role {"admin"}
  end

  factory :reader, parent: :user do
    role {"reader"}
  end
end
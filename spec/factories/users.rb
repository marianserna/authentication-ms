FactoryBot.define do
  factory :user do
    name "Pedro Pedrosa"
    sequence :email do |n|
      "pedritopedrosa#{n}@email.com"
    end
    password "password"
  end
end

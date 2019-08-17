FactoryBot.define do
  factory :user do
    nickname              {"taro"}
    email                 {"aaa@yahoo.co.jp"}
    password              {"1234abcd"}
    password_confirmation {"1234abcd"}
  end
end
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyString"
    subtitle "MyString"
    content "MyText"
    user_id 1
  end
end

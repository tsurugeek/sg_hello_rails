FactoryBot.define do
  factory :entry, class: "Entry" do
    sequence(:title) { |n| "title#{n}"}
    blog
  end
end

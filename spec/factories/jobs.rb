FactoryGirl.define do
  factory :job do
    association :project
    title "MyString"
    description "MyText"
  end
end

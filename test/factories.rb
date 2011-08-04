FactoryGirl.define do

  factory :project do
    sequence(:name) {|n| "Project #{n}" }

    factory :test_project do
      after_create do |p|
        p.tasks << FactoryGirl.build(:task, :project => p)
        p.tasks << FactoryGirl.build(:task, :project => p)
        p.tasks << FactoryGirl.build(:task, :project => p)
      end
    end
  end

  factory :task do
    sequence(:name) {|n| "Task #{n}" }
    project
  end

end
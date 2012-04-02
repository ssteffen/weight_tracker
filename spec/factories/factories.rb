FactoryGirl.define do
  factory :quick_weight, :class => "Weight" do
    weight 100
    created_at Time.now - 23.hours
    updated_at Time.now - 23.hours
  end

  factory :old_weight, :class => "Weight" do
    weight 125
    created_at Time.now - 4.days
    updated_at Time.now - 4.days
  end

  factory :quick_mood, :class => 'Mood' do
    mood 50
  end

  factory :old_mood, :class => 'Mood' do
    mood 80
    created_at Time.now - 2.days
    updated_at Time.now - 2.days
  end

end

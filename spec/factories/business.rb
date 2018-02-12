FactoryGirl.define do

  factory :business do
             id    1
             name "Bizniz"
             description "Good"
             funding_needed 600
  end

  factory :business_with_regions, :parent => :business do
    categories {[FactoryGirl.create(:region)]}
  end


  factory :business_with_categories, :parent => :business do
    categories {[FactoryGirl.create(:category)]}
  end

end

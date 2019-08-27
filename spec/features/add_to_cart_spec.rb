require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Add item will add 1 to My Cart number" do
    visit root_path
    expect(page).to have_content 'My Cart (0)'
    click_on('Add', match: :first )
    # save_and_open_screenshot "test.png"
    expect(page).to have_content 'My Cart (1)'
  end
end
  

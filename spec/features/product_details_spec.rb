require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"

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
    @product1 = @category.products.first

  end

  scenario "See product details" do
    # ACT
    visit root_path

    product_id_link = '/products/' + @product1.id.to_s
    # visit '/products/1'
    # visit product_id_link

    click_on @product1.name

    # puts page.html

    # DEBUG / VERIFY
    save_screenshot

    expect(page).to have_css 'article.product-detail'
  end


end

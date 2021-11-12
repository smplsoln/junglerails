class Admin::DashboardController < ApplicationController
  def show
    @productscount = Product.all.count.to_s
    # puts 'Product count: ' + @productscount.to_s
    @categoriescount = Category.all.count.to_s
    # puts 'Cetegories count: ' + @categoriescount.to_s

  end
end

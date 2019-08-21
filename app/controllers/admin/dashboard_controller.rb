class Admin::DashboardController < ApplicationController
    
  http_basic_authenticate_with :name => ENV['USERNAME'], :password => ENV['PASSWORD']

  def show
    @total_product_number = Product.all.count
    @total_category_number = Category.all.count
  end
  
end

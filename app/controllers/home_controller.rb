class HomeController < ApplicationController
  def index
    @sales_data = Sale.group_by_month(:created_at, format: "%b %Y").sum(:amount)
  end
end

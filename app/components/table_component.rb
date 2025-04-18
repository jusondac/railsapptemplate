# frozen_string_literal: true

class TableComponent < ViewComponent::Base
  def initialize(columns:, title:, data:)
    @title = title
    @columns = columns
    @userlist = data
  end
end

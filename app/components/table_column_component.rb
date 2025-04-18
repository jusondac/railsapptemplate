# frozen_string_literal: true

class TableColumnComponent < ViewComponent::Base
  renders_one :button_actions
  def initialize(data:, columns:, actions:)
    @data = data
    @columns = columns
    @actions = actions
  end
end

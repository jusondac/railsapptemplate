# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  renders_one :icon
  renders_one :form
  def initialize(title:, modal_id:)
    @title = title
    @modal_id = modal_id
  end
end

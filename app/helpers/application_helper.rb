# frozen_string_literal: true

module ApplicationHelper
  def page_title(page_title = "")
    base_title = "Gym Helper"
    if page_title.present?
      "#{page_title}"
    else
      "#{base_title}"
    end
  end
end

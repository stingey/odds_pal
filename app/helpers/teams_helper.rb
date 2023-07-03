# frozen_string_literal: true
module TeamsHelper
  def button_color(sport_group)
    case sport_group
    when 'MLB'
      "bg-red-500"
    when 'NBA'
      "bg-blue-500"
    when 'ATP'
      "bg-lime-500"
    end
  end
end


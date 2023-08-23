module ApplicationHelper
  def flash_class(type)
    case type
    when "success"
      "bg-green-500"
    when "error"
      "bg-red-500"
    when "notice"
      "bg-blue-500"
    when "alert"
      "bg-yellow-500"
    else
      "bg-gray-500"
    end
  end
end

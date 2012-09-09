module ApplicationHelper
  def flash_name_to_bootstrap_alert(flash_name)
    case flash_name
      when :notice then :success
      when :alert then :error
      else flash_name
    end
  end
end

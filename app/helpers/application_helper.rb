module ApplicationHelper

	def flash_class(type)
		case type
		when :alert
			"alert-danger"
		when :notice
			"alert-warning"
		else
			""
		end
	end
end

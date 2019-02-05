module ApplicationHelper

    def auth_token
        html = "<input type=\"hidden\" name=\"authenticity_token\""
        html += "value=\"#{form_authenticity_token}\">"
        html.html_safe
    end

    def footer_gen
        html = "<p>This is the #{caller[0][/[^:]+/][56...-9]} "
        html += "cat place </p>"
        html.html_safe
  end
end

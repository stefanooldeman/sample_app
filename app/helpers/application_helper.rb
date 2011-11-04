module ApplicationHelper
    def title
        base = "Ruby on Rails Tutorial Sample App"
        if @title.nil?
            base
        else
            "#{base} | #{@title}"
        end
    end
end

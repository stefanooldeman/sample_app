module ApplicationHelper

    #title helper
    def title
        if !@full_title.nil?
            return @full_title
        end

        base_title = "Ruby on Rails Tutorial Sample App"
        if @title.nil?
            base_title
        else 
            "#{base_title} | #{@title}"
        end
    end

end

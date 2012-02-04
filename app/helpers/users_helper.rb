module UsersHelper
    def gravatar_for (user, options = { :size => 50 })
        # proxy method for `gravatar_image_tag` gem
        gravatar_image_tag user.email.downcase, 
            :alt => user.name, 
            :class => "gravatar",
            :gravatar => options
    end
end

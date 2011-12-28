class String
    def shuffle
        self.split('').sort_by { rand }.join
    end
end

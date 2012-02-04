#By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
    user.name "Stefano Oldeman"
    user.email "soldeman@example.com"
    user.password "foobar"
end

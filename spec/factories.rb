#By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
    user.name "Example user"
    user.email "user@example.com"
    user.password "foobar"
end

# user-base
user-base is an API wrapper for the Roblox [users](https://users.roblox.com/) API endpoint wrote in the Ruby programming
language.

## Unauthenticated features
These features do not require a token, and can be interacted with freely.

- Search for a user
- Grab user information
- Grab user's username history
  
## Authenticated features
These features do require a token due to them interacting with your own account.

- Get your account's birthdate
- Get your account's description
- Get your account's gender
- Get your account's country code
- Get your account's roles 

## Setup

As this is an unfinished project and purely experimental I have not turned this into an official gem that 
you can download, so you will need to clone the repository. I will assume that you know how to get a roblox 
cookie value, so I will not be writing instructions for that task.


1. To clone the repository use this command: `git clone https://github.com/m-attz/user-base.git`

2. You must then open the folder in an IDE, or if you would like to use this with IRB (I would not recommend) then simply 
navigate to the sub-directory/directory you cloned it to.

3. Once you have done that you can now start experimenting with the module. Remember to also require the module.

I would recommend using the **testing.rb** file that I have provided.

  

## Example usage from the testing file

```
# Require the module file and JSON library 
require_relative '../lib/user_api.rb'
require 'json'

# Create a new user object with a cookie property
user = User.new('Your cookie value')


# Return the value from user.info() and store it 
req = user.info(000000001)

# Parse the string value which returns a hash
parsed = JSON.parse(req)

# Conditional logic to determine if the given user is banned or not
if parsed['isBanned'] == false 
    puts sprintf('User: %s is not banned', parsed['name'])
else
    puts sprintf('User: %s is banned', parsed['name'])
end
```

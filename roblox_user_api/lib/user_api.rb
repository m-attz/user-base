#!/usr/bin/ruby

require 'net/http'

class User
    # Define a global variable containing the API domain
    @@api_url = ['https://users.roblox.com/v1/']

    # Initiate a roblox token value
    def initialize(token)
        @token = token
    end


    # Uses token to authenticate for certain API endpoints | send_dynamic_request(uri: String) -> String
    def send_dynamic_request(uri)
        headers = {
            'Cookie': @token
        }

        begin
            uri = URI(uri)
            response = Net::HTTP.get(uri, headers)
            return response
        rescue Net::HTTPBadResponser => error 
            sprintf('Bad HTTP response: %s', error)
        end
    end


    # A basic GET request that does not require authentication (cookie, token, etc) | send_request(uri: String) -> String
    def send_request(uri)
        
        begin
            response = Net::HTTP.get(URI(uri))
            return response
        rescue Net::HTTPBadResponse => error 
            sprintf('Bad HTTP response: %s', error)
        end
    end


    # Grabs basic information on a given roblox id | info(roblox_id: int) -> String
    def info(roblox_id)
        send_request(@@api_url[0] + 'users/' +roblox_id.to_s)     
    end


    # Retrieves all username history of a given roblox id | username_history(roblox_id: int) -> String
    def username_history(roblox_id)
        send_request(@@api_url[0] + 'users/' + roblox_id.to_s + '/username-history')
    end


    # Retrives all users with a given keyword, and limit | search(keyword: String, cursor: int) -> String
    def search(keyword, cursor)
        construct_uri = sprintf(@@api_url[0] + 'users/' + 'search?keyword=%s&limit=%s', keyword, cursor.to_s)
        send_request(construct_uri)
    end


    # Retrives birthdate of given roblox account (authenticated) | get_birthdate -> String
    def get_birthdate
        send_dynamic_request(@@api_url[0] + 'birthdate')
    end


    # Retrives description of given roblox account (authenticated) | get_description -> String
    def get_description
        send_dynamic_request(@@api_url[0] + 'description')
    end


    # Retrives gender of given roblox account (authenticated) | get_gender -> String
    def get_gender
        send_dynamic_request(@@api_url[0] + 'gender')
    end


    # Retrives age bracket of given roblox account (authenticated) | get_age_bracket -> String
    def get_age_bracket
        send_dynamic_request(@@api_url[0] + 'users/authenticated/age-bracket')
    end 


    # Retrives country code of a given roblox account (authenticated) | get_country_code -> String
    def get_country_code
        send_dynamic_request(@@api_url[0] + 'users/authenticated/country-code')
    end

    
    # Retrives roles of a given roblox account (authenticated) | get_roles -> String
    def get_roles
        send_dynamic_request(@@api_url[0] + 'users/authenticated/roles')
    end

end
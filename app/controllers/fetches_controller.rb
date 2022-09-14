class FetchesController < ApplicationController
require 'rest-client'

    #template method to be used for all social sites and reduce dry code
    def get_data(url)
        #use 'begin' and 'rescue' in case of errors
        begin
            response = RestClient.get(url)
        rescue => exception
            response = 'An error has occured. Please try again.'
        end
    end

    #fetch data from twitter using RestClient
    def get_twitter
        get_data("https://takehome.io/twitter")
    end

    #render twitter data in JSON format
    #separating 'get' and 'show' for separation of concerns and to avoid double render error
    def show_twitter
        response = get_twitter()
        render json: response
    end

    #fetch data from facebook using RestClient, render to page in JSON format
    def get_facebook
       get_data("https://takehome.io/facebook")
    end

    #render facebook data in JSON format
    def show_facebook
        response = get_facebook()
        render json: response
    end

    #fetch data from instagram using RestClient
    def get_instagram
        get_data("https://takehome.io/instagram")
    end

    #render instagram data in JSON format
    def show_instagram
        response = get_instagram()
        render json: response
    end

    #render object on index ('/') containing JSON for all social networks 
    def index
        collection = {
            twitter: get_twitter(), 
            facebook: get_facebook(), 
            instagram: get_instagram()
        }
       render json: collection
    end
end
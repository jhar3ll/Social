class FetchesController < ApplicationController
require 'rest-client'

# use a global hash in which each social site can add its response to if we need to render data from all sites
$collection = {twitter: '', facebook: '', instagram: ''}

    #fetch data from twitter using RestClient, render to page in JSON format
    def get_twitter
        #use 'begin' and 'rescue' in case of errors
        begin
            url = "https://takehome.io/twitter"
            $twitter_resp = RestClient.get(url)
        rescue => exception
            $twitter_resp = 'An error has occured. Please try again'
        end
        $collection[:twitter] = $twitter_resp 
    end

    #render twitter data in JSON format
    #separating 'get' and 'show' for separation of concerns and to avoid double render error
    def show_twitter
        render json: $twitter_resp
    end

    #fetch data from facebook using RestClient, render to page in JSON format
    def get_facebook
        begin
            url = "https://takehome.io/facebook"
            $fb_resp = RestClient.get(url)
        rescue => exception
            $fb_resp = 'An error has occured. Please try again'
        end
        $collection[:facebook] = $fb_resp
    end

    #render facebook data in JSON format
    def show_facebook
        render json: $fb_resp
    end

    #fetch data from instagram using RestClient
    def get_instagram
        begin
            url = "https://takehome.io/instagram"
            $ig_resp = RestClient.get(url)
        rescue => exception
            $ig_resp = 'An error has occured. Please try again'
        end
        $collection[:instagram] = $ig_resp
    end

    #render instagram data in JSON format
    def show_instagram
        render json: $ig_resp
    end

    #render object on index ('/') containing JSON for all social networks 
    def get_all
        get_facebook()
        get_instagram()
        get_twitter()
       render json: $collection
    end
end
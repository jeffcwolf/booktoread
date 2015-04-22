require 'open-uri'
require 'json'

class StaticPagesController < ApplicationController
  def home
    #Obtain book list names for subsequent use in API requests

    @listnames_url = "http://api.nytimes.com/svc/books/v3/lists/names.json?api-key=#{NYT_BOOKSAPI_KEY}"

    @raw_results_list = open(@listnames_url).read

    @parsed_results_list = JSON.parse(@raw_results_list)

    @listnames_full = @parsed_results_list["results"]

    #Take full list and iterate through only the list names in each array
    #Save those names in a new array

    @listnames = []

    @listnames_full.each do |list|
        @listnames.push(list["list_name"])
    end

    #Create a sub-list of all the less common genres and save them here

    #Create a sub-list of all the most common genres and save them here

    #Replace spaces with hyphens and downcase (e.g. hardcover-fiction)
    #to obtain URL-ready list names

    @listnames_URL_ready = []

    @listnames.each do |list_item|
        @listnames_URL_ready.push(list_item.downcase.gsub(/\s/, '-'))
    end

    #Implement the API request for the list of Best Sellers by Genre

    @booksapi_url = "http://api.nytimes.com/svc/books/v3/lists/#{@listnames_URL_ready[3]}.json?api-key=#{NYT_BOOKSAPI_KEY}"

    @raw_results = open(@booksapi_url).read

    @parsed_results = JSON.parse(@raw_results)

    # @fiction_overview = @parsed_results["results"]["lists"][0]
    # @nonfiction_overview = @parsed_results["results"]["lists"][1]
    # @hardfiction_overview = @parsed_results["results"]["lists"][2]
    # @hardnonfiction_overview = @parsed_results["results"]["lists"][3]
    # @paperfiction_overview = @parsed_results["results"]["lists"][4]
    # @massfiction_overview = @parsed_results["results"]["lists"][5]
    # @papernonfiction_overview = @parsed_results["results"]["lists"][6]
    # @efiction_overview = @parsed_results["results"]["lists"][7]
    # @enonfiction_overview = @parsed_results["results"]["lists"][8]
    # @advicehowto_overview = @parsed_results["results"]["lists"][9]
    # @picturebooks_overview = @parsed_results["results"]["lists"][10]
    # @childrenmiddlegrade_overview = @parsed_results["results"]["lists"][11]
    # @youngadult_overview = @parsed_results["results"]["lists"][12]
    # @childrenseries_overview = @parsed_results["results"]["lists"][13]
    # @hardgraphics_overview = @parsed_results["results"]["lists"][14]
    # @papergraphics_overview = @parsed_results["results"]["lists"][15]
    # @manga_overview = @parsed_results["results"]["lists"][16]
    # @animals_overview = @parsed_results["results"]["lists"][17]
    # @business_overview = @parsed_results["results"]["lists"][18]
    # @celebrities_overview = @parsed_results["results"]["lists"][19]
    # @crimepunishment_overview = @parsed_results["results"]["lists"][20]
    # @culture_overview = @parsed_results["results"]["lists"][21]
    # @education_overview = @parsed_results["results"]["lists"][22]
    # @espionage_overview = @parsed_results["results"]["lists"][23]
    # @disastersadventures_overview = @parsed_results["results"]["lists"][24]
    # @family_overview = @parsed_results["results"]["lists"][25]
    # @fashionmanners_overview = @parsed_results["results"]["lists"][26]
    # @foodfitness_overview = @parsed_results["results"]["lists"][27]
    # @games_overview = @parsed_results["results"]["lists"][28]
    # @health_overview = @parsed_results["results"]["lists"][29]
    # @humor_overview = @parsed_results["results"]["lists"][30]
    # @indigenous_overview = @parsed_results["results"]["lists"][31]
    # @hardpolitical_overview = @parsed_results["results"]["lists"][32]
    # @race_overview = @parsed_results["results"]["lists"][33]
    # @relationships_overview = @parsed_results["results"]["lists"][34]
    # @religion_overview = @parsed_results["results"]["lists"][35]
    # @science_overview = @parsed_results["results"]["lists"][36]
    # @sports_overview = @parsed_results["results"]["lists"][37]

    # Travel Lists & Methods
    @travel_overview = @parsed_results["results"]["books"]

  end

  def help
  end

  def about
  end
end

require 'net/http'
require 'json'
require "csv"

KEYID =ENV['KEYID']
COUNT = 100
PREF = "Z011"
FREEWORD = "渋谷駅"
FORMAT = "json"
PARAMS = {"key": KEYID, "count":COUNT, "large_area":PREF, "keyword":FREEWORD, "format":FORMAT}


def write_data_to_csv()
    restaurants = []
    response = "hogehoge"
    
    if response.has_key?("error") then
        puts "エラーが発生しました！"
    end
    for restaurant in response["results"]["shop"] do
        rest_name = restaurant["name"]
        restaurants.append(rest_name)
    end

    File.open("restaurants_list.csv", "w") do |file|
        file << restaurants
    end

    return puts restaurants
end
require 'net/http'
    require 'json'
    require "csv"

    # 初期設定
    ENV['KEYID']

    keyid = ENV['KEYID']
    count = 100
    pref = ""
    freeword = "高松"
    format = "json"
    params = {"key":keyid, "count":count, "large_area":pref, "keyword":freeword, "format":format}


        restaurants = [["名称","営業日","住所","アクセス"]]
        uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/")
        uri.query = URI.encode_www_form(params)  
        json_res = Net::HTTP.get uri
        
        response = JSON.load(json_res)
        
        if response.has_key?("error") then
            puts "エラーが発生しました！"
        end
        for restaurant in response["results"]["shop"] do
            rest_info = [restaurant["name"], restaurant["open"], restaurant["address"]]
            puts rest_info
            restaurants.append(rest_info)
        end
        

        @test = restaurants
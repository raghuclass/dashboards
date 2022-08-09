require "net/http"
require "json"

class ApplicationController < ActionController::Base
  def home
    render({ :template => "home.html.erb" })
  end

  def forex
    url = "https://api.exchangerate.host/symbols"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_obj = JSON.parse(response)
    @currency = response_obj["symbols"].keys

    render({ :template => "forex.html.erb" })
  end

  def convert_from
    @symbol1 = params.fetch("symbol")
    url = "https://api.exchangerate.host/symbols"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_obj = JSON.parse(response)
    @currency = response_obj["symbols"].keys

    render({ :template => "forex_convert_from.html.erb" })
  end

  def convert_from_to
    @symbol1 = params.fetch("symbol1")
    @symbol2 = params.fetch("symbol2")
    url = "https://api.exchangerate.host/convert?from=" + @symbol1 + "&to=" + @symbol2
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_obj = JSON.parse(response)

    @exchangerate = response_obj["result"]

    render({ :template => "converted.html.erb" })
  end

  def covid
    render({ :template => "covid.html.erb" })
  end
end

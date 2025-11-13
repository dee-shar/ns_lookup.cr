require "json"
require "http/client"

class NsLookup
  API_PATH = "api/v1"
  def initialize
    @headers = HTTP::Headers{
      "Content-Type" => "application/json",
      "Accept" => "application/json",
      "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36"
    }
    uri = URI.parse("https://www.nslookup.io")
    @http_client = HTTP::Client.new(uri)
  end

  def dns_lookup(domain : String, dns_server : String) : JSON::Any
    body = {
      "domain" => domain,
      "dnsServer" => dns_server
    }.to_json
    JSON.parse(
      @http_client.post("/#{API_PATH}/records", headers: @headers, body: body).body)
  end
end

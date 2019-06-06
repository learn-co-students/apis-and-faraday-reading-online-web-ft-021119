class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|

      req.params['client_id'] = 'VT21R4WVCRY5VAQS2APVWXDBXDCPNZOJJ5QFCBCJZPPPUZY5'
      req.params['client_secret'] = 'SQDCR24RTR5XY11YK2TZNQNSA1TURQOP3RVYBDHOO43H0A5O'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
   body = JSON.parse(@resp.body)
  if @resp.success?
    @venues = body["response"]["venues"]
  else
    @error = body["meta"]["errorDetail"]
  end
  body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
  render 'search'
  end
end

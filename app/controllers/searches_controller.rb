class SearchesController < ApplicationController
  before_action :app_auth, only: [:foursquare]

  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = @app_auth[:client_id]
      req.params['client_secret'] = @app_auth[:client_secret]
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    @venues = JSON.parse(@resp.body)["response"]["venues"]
    render :search
  end

  private
    def app_auth
      @app_auth = {
        client_id: "NSFPBVY2JTJ2VIFNWLTHBUFEYAEEXT15DV1KHICNEJ3LNIG2",
        client_secret: "J4GDRURCKKUASAJIGMR3SQDPTQM4FMS4RQSHYPED4EV3IBIK"
      }
    end

end

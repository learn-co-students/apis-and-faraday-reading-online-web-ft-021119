class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
   req.params['client_id'] = 'DGYVOFP3CCWB0YMKHOX5QVTLBOVMDK220GKL0B5SDUTG2UBQ'
   req.params['client_secret'] = 'C0MKOGJ22AFK2B1VFJRWGT1AIKFKR4VDLK03LUMQXGRTAIZ5'
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
 render 'search'
   end
end

class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'KL11ICAGOXSAFWSZK0EVKGLVOTZ4NJQPIJYPXLCHAEE0ZGEJ'
      req.params['client_secret'] = ' 3DTPXSXKJESEMHSPNVHZDAPCPMKYXMNJKWEPVO5OB1NBXZDS'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
end

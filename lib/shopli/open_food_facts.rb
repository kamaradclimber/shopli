require 'rest_client'

class Shopli
  class OpenFoodFacts

    API_URL = 'http://fr.openfoodfacts.org/api'
    API_VERSION = 'v0'
    API_ENDPOINT = 'produit'

    def product(barcode)
      url = [API_URL, API_VERSION, API_ENDPOINT, barcode + '.json'].join '/'
      resource = RestClient::Resource.new url
      resource.get
    end
  end
end

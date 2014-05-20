require 'rest_client'

class Shopli
  class OpenFoodFacts

    API_URL = 'http://fr.openfoodfacts.org/api'
    API_VERSION = 'v0'
    API_ENDPOINT = 'produit'

    def fetch_product(barcode)
      url = [API_URL, API_VERSION, API_ENDPOINT, barcode + '.json'].join '/'
      resource = RestClient::Resource.new url
      resource.get
    end

    def product(barcode)
      json = fetch_product(barcode)
      p = JSON.parse(json)
      if p['status'] == 1
        product = Product.new p['product']['_id']
        product.name = p['product']['generic_name']
        product
      else
        nil
      end
    end
  end
end

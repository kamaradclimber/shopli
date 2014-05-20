require_relative 'spec_helper.rb'

describe Shopli::OpenFoodFacts do
  describe 'products' do

    it 'calls the correct url' do
      rest_client = double('rest_client')
      allow(RestClient::Resource).to receive(:new).
        with('http://fr.openfoodfacts.org/api/v0/produit/3029330003533.json').
        and_return(rest_client)
      allow(rest_client).to receive(:get)
      off = Shopli::OpenFoodFacts.new
      off.fetch_product('3029330003533')
    end

  end
end

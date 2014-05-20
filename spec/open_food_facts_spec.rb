require_relative 'spec_helper.rb'

describe Shopli::OpenFoodFacts do
  describe '.fetch_product' do

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

  describe '.product' do
    it 'return nil when product does not exist' do
      rest_client = double('rest_client')
      allow(RestClient::Resource).to receive(:new).and_return(rest_client)
      allow(rest_client).to receive(:get).and_return('{"status_verbose":"product not found","status":0,"code":"302933678560003533"}')
      off = Shopli::OpenFoodFacts.new
      expect(off.product('inexistant_product')).to be_nil
    end

    it 'return a product otherwise' do
      rest_client = double('rest_client')
      allow(RestClient::Resource).to receive(:new).and_return(rest_client)
      allow(rest_client).to receive(:get).and_return(File.read(File.join(File.dirname(__FILE__), '3029330003533.json')))
      off = Shopli::OpenFoodFacts.new
      product = off.product('3029330003533')
      expect(product).to be_a(Shopli::Product)
      expect(product.id).to eq '3029330003533'
      expect(product.name).to eq 'Pain complet en tranche'
    end

  end

end

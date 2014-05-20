require_relative '../spec_helper.rb'

describe Shopli::OpenFoodFacts do
  describe 'products' do

    it 'can call openfoodfacts.org' do
      off = Shopli::OpenFoodFacts.new
      expect{ @product = off.product('3029330003533') }.not_to raise_error
      expect{ JSON.parse(@product) }.not_to raise_error
    end

  end
end

require 'rspec'
require './lib/product'
require './lib/shopping_cart'


describe ShoppingCart do
  context 'iteration 2' do
    it 'Shopping cart exists' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart).to be_an_instance_of ShoppingCart
    end

    it 'Shopping Cart has readable attributes' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.name).to eq "King Soopers"
      expect(cart.capacity).to eq 30
      expect(cart.products).to eq []
    end

    it 'Shopping Cart can add products to its products array' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      cart.add_product(product1)
      cart.add_product(product2)

      expect(cart.products).to eq [product1, product2]
    end

    it 'Shopping Cart returns details in a hash' do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.details).to eq ({name: "King Soopers", capacity: 30})
    end
  end
end

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
  context 'iteration 3' do
    it 'Shopping Cart can calculate total number of products in cart' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)

      expect(cart.total_number_of_products).to eq 13
    end

    it 'Shopping Cart can determine if it is full' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)

      expect(cart.is_full?).to eq false

      product4 = Product.new(:produce, 'apples', 0.99, '20')
      cart.add_product(product4)

      expect(cart.is_full?).to eq true
    end

    it 'Shopping Cart can return products by category' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      product4 = Product.new(:produce, 'apples', 0.99, '20')
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
      cart.add_product(product4)

      expect(cart.products_by_category(:paper)).to eq [product1, product3]
    end
  end
  context 'iteration 4' do
    it 'Shopping Cart can calculate percentage of space occupied' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)

      expect(cart.percentage_occupied).to eq 43.33
    end

    it 'Shopping Cart can sort products by quantity' do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      product4 = Product.new(:produce, 'apples', 0.99, '20')
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
      cart.add_product(product4)

      expect(cart.sorted_products_by_quantity).to eq([product3, product2, product1, product4])
    end

    it "Shopping Cart return a hash with a breakdown by category" do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      product4 = Product.new(:produce, 'apples', 0.99, '20')
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
      cart.add_product(product4)

      expect(cart.product_breakdown).to eq ({meat: [product2], paper: [product1, product3], produce: [product4]})
    end
  end
end

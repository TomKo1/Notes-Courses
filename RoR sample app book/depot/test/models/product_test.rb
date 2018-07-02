require 'test_helper'

class ProductTest < ActiveSupport::TestCase
    # for Rails to know which fixtures to load
    fixtures :products  
    # checks if validation works
    test "product attributes must not be empty" do
        product = Product.new 
        assert product.invalid?
        assert product.errors[:title].any?
        assert product.errors[:description].any?
        assert product.errors[:price].any?
        assert product.errors[:image_url].any?
    end

    test "product price must be positive" do
      product = Product.new(title: "My Book Title", description: "yyy", image_url: "zzz.png")
      
      product.price = -1
      assert product.invalid? 
      assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

      product.price = 0
      assert product.invalid?
      assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]
      
      product.price = 1
      assert product.valid?
    end

    

    test "image url" do
      ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
                http://a.b/bla/fred.gif }
      bad = %w{ fred.doc fred.gif/more fred.gif.more }
  
      ok.each do |name|
        assert new_product(name).valid?, "#{name} shouldn't be invalid"
      end
  
      bad.each do |name|
        assert new_product(name).invalid?, "#{name}, shouldn't be valid"
      end
    end


    def new_product(image_url)
      product = Product.new(title: "My Book Title", description: "yyy",price: 1 ,image_url: image_url)
    end

    # test using fixtures - testing the validation 
    # of unique product titles
    test "product is not valid without a unique title" do
        product = Product.new( title: products(:ruby).title,
                                description: "yyy",
                                price: 1,
                                image_url: "fred.gif")
        assert product.invalid?
        assert_equal ["has already been taken"], product.errors[:title]
    end

    test "title should have at least ten chracters" do
      product = Product.new( title: "Some",
                              description: "yyy",
                              price: 1,
                              image_url: "fred.gif")
      assert product.invalid?
      product.title = "Some title longer than ten characters"
      assert product.valid?
    end

end

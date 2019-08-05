require "sales_taxes"

describe Taxes do
    
    it "Retuns the first set correctly" do
        basket_list = [{quantity: 1, product: "book", price: 12.49},
                       {quantity: 1, product: "music cd", price: 14.99},
                       {quantity: 1, product: "chocolate bar", price: 0.85}]
        expected_list = [{quantity: 1, product: "book", price: 12.49},
                       {quantity: 1, product: "music cd", price: 16.49},
                       {quantity: 1, product: "chocolate bar", price: 0.85}]
        taxes = Taxes.new
        returned_list = taxes.product_information(basket_list)
        expect(returned_list[0]).to eq(expected_list[0])
        expect(returned_list[1]).to eq(expected_list[1])
        expect(returned_list[2]).to eq(expected_list[2])
    end

    it "Retuns the second set correctly" do
        basket_list = [{quantity: 1, product: "imported box of chocolates", price: 10.00},
                       {quantity: 1, product: "imported bottle of perfume", price: 47.50}]
        expected_list = [{quantity: 1, product: "imported box of chocolates", price: 10.50},
                       {quantity: 1, product: "imported bottle of perfume", price: 54.65}]
        taxes = Taxes.new
        returned_list = taxes.product_information(basket_list)
        expect(returned_list[0]).to eq(expected_list[0])
        expect(returned_list[1]).to eq(expected_list[1])
    end

    it "Retuns the third set correctly" do
        basket_list = [{quantity: 1, product: "imported bottle of perfume", price: 27.99},
                       {quantity: 1, product: "bottle of perfume", price: 18.99},
                       {quantity: 1, product: "packet of headache pills", price: 9.75},
                       {quantity: 1, product: "box of imported chocolates", price: 11.25}]
        expected_list = [{quantity: 1, product: "imported bottle of perfume", price: 32.19},
                       {quantity: 1, product: "bottle of perfume", price: 20.89},
                       {quantity: 1, product: "packet of headache pills", price: 9.75},
                       {quantity: 1, product: "box of imported chocolates", price: 11.85}]
        taxes = Taxes.new
        returned_list = taxes.product_information(basket_list)
        expect(returned_list[0]).to eq(expected_list[0])
        expect(returned_list[1]).to eq(expected_list[1])
        expect(returned_list[2]).to eq(expected_list[2])
        expect(returned_list[3]).to eq(expected_list[3])
    end
end
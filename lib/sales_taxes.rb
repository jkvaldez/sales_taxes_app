require "active_support/core_ext/enumerable"

class Taxes

    def product_information(basket_list)

        non_taxable = %W(book chocolate\sbar 
                         packet\sof\sheadache\spills)
        taxable = %W(music\scd
                     bottle\sof\sperfume )
        imported_non_taxable = %W(imported\sbox\sof\schocolates 
                                  box\sof\simported\schocolates)
        imported_taxable = %W(imported\sbottle\sof\sperfume)
        receipt = []
        taxes = []
        price_taxed = []

        basket_list.each do |basket| 
            
            case
            when non_taxable.include?(basket[:product])
                price_taxed.push(basket[:price])
                receipt.push(basket)
                puts "#{basket[:quantity]}, #{basket[:product]}, #{basket[:price]}"    
            when taxable.include?(basket[:product])
                tax_amount = compute_tax(basket[:price], 0.1)
                taxes.push(tax_amount)
                basket[:price] = (basket[:price] + tax_amount).round(2)
                price_taxed.push(basket[:price])
                receipt.push(basket)
                puts "#{basket[:quantity]}, #{basket[:product]}, #{basket[:price]}"
            when imported_non_taxable.include?(basket[:product])
                import_tax_amount = compute_tax(basket[:price], 0.05)
                taxes.push(import_tax_amount)
                
                basket[:price] = (basket[:price] + import_tax_amount).round(2)
                
                price_taxed.push(basket[:price])
                receipt.push(basket)
                puts "#{basket[:quantity]}, #{basket[:product]}, #{basket[:price]}"
            when imported_taxable.include?(basket[:product])
                import_tax_amount = compute_tax(basket[:price], 0.05)
                tax_amount = compute_tax(basket[:price], 0.1)
                taxes.push(tax_amount, import_tax_amount)
                basket[:price] = (basket[:price] + import_tax_amount + tax_amount).round(2)
                price_taxed.push(basket[:price])
                receipt.push(basket)
                puts "#{basket[:quantity]}, #{basket[:product]}, #{basket[:price]}"
            end
        end
        
        puts "Sales Taxes: #{taxes.sum.round(2)}"
        puts "Total: #{price_taxed.sum.round(2)}"
        return receipt

    end

    def compute_tax(price, taxable_percent)
        taxable_percent = (price * taxable_percent).round(2)
        if taxable_percent.to_s[-1, 1].to_i > 5
            taxable_percent = taxable_percent.round(1)
        end
        return taxable_percent
    end
end
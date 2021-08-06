class Product < ApplicationRecord
    has_one_attached :avatar

    def self.search(search)
        if search
            self.where(name: search)
            # products = Product.find_by(name: search)
            # if product
            #     @products 
            else
                Product.all
    end 
end

end 
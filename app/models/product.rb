class Product < ApplicationRecord
    has_one_attached :avatar
    # has_and_belongs_to_many :shopping_cart
    has_many :line_items, dependent: :destroy
    has_many :shopping_carts, through: :line_items

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
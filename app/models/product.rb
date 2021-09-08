class Product < ApplicationRecord
    has_one_attached :avatar
    has_many :line_items, dependent: :destroy
    has_many :shopping_carts, through: :line_items

    def self.search(search)
        if search
            self.where(name: search)
            else
                Product.all
    end 
end

end 
class User < ApplicationRecord
    has_secure_password
    has_one :shopping_cart
end

class Order < ApplicationRecord
    # enums to store in pay_type column - only discrete values
    enum pay_type: {
        "Check" => 0,
        "Credit card" => 1,
        "Purchase order" => 2
    }
    
end

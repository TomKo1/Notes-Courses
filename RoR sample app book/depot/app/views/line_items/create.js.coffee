cart = document.getElementById("cart")
# render the HTML into the cart element
cart.innerHTML = "<%= j render(@cart) %>"

# j -> alias for escape_javascript() helper method
# which converts thie Ruby string into a format 
# accetable as input to JavaScript

# hide notice 'your cart is empty'
notice = document.getElementById("notice")
if notice  
    notice.style.display = "none"





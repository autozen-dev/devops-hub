#!/bin/bash

echo "=============== Welcome to the Super Store!"

products() {
    echo "Here are the products available in our store:"
    
    # local keeps this array scoped to the products function.
    local product_list=("Apple" "Banana" "Orange" "Grapes" "Mango")
    
    # ${product_list[@]} expands each array item into a separate argument for stock.
    stock "${product_list[@]}"
}

stock() {
    # $@ contains all arguments passed to this function.
    printf '%s\n' "$@"
}

products
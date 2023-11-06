//
//  Product.swift
//  UNGUARDED
//
//  Created by Salman Hasan on 11/5/23.
//

import Foundation

struct Product: Identifiable{
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [Product(name: "UNGUARDED Sticker", image: "unguardedsticker", price:28),
]

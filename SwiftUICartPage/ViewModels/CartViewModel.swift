//
//  CartViewModel.swift
//  SwiftUICartPage
//
//  Created by Amby on 26/09/2022.
//

import Foundation

class CartViewModel: ObservableObject {

    @Published var items = [
        Item(name: "Peace Skull Shirt", details: "GRay-L", image: "cloth-1", price: 60.50, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Peace Skull Shirt", details: "GRay-L", image: "cloth-2", price: 20.00, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Peace Skull Shirt", details: "GRay-L", image: "cloth-3", price: 80.50, quantity: 1, offset: 0, isSwiped: false),
        Item(name: "Peace Skull Shirt", details: "GRay-L", image: "cloth-4", price: 50.50, quantity: 1, offset: 0, isSwiped: false)

    ]
}

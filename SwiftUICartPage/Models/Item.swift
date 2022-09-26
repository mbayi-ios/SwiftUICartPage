//
//  Item.swift
//  SwiftUICartPage
//
//  Created by Amby on 26/09/2022.
//

import Foundation
import SwiftUI

struct Item: Identifiable {
    var id = UUID().uuidString
    var name: String
    var details: String
    var image: String
    var price: Float
    var quantity: Int
    var offset: CGFloat
    var isSwiped: Bool
}

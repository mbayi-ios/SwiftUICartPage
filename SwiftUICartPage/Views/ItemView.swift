//
//  ItemView.swift
//  SwiftUICartPage
//
//  Created by Amby on 26/09/2022.
//

import SwiftUI

struct ItemView: View {
    @Binding var item: Item
    @Binding var items: [Item]

    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [Color(.blue), Color(.blue)]), startPoint: .leading, endPoint: .trailing)

            HStack {
                Spacer()

                Button(action: {
                    withAnimation(.easeIn){
                        deleteItem()
                    }
                }) {
                    Image(systemName: "trash")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 90, height: 50)
                }
            }
            HStack(spacing: 15) {
                Image(item.image)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 130, height: 130)
                    .cornerRadius(15)

                VStack(alignment: .leading, spacing: 10) {
                    Text(item.name)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)

                    Text(item.details)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)

                    HStack(spacing: 15) {
                        Text(getPrice(value: item.price))
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        Spacer(minLength: 0)

                        Button(action: {
                            if item.quantity > 1 {item.quantity -= 1}
                        }) {
                            Image(systemName: "minus")
                                .font(.system(size: 14, weight: .heavy))
                                .foregroundColor(.black)
                        }

                        Text("\(item.quantity)")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .background(Color.black.opacity(0.06))

                        Button(action: {item.quantity += 1}) {
                            Image(systemName: "plus")
                                .font(.system(size: 14, weight: .heavy))
                                .foregroundColor(.black)
                        }
                    }

                }
            }
            .padding()
            .background(Color(.white))
            .contentShape(Rectangle())
            .offset(x: item.offset)
            .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
        }
    }

    func onChanged(value: DragGesture.Value) {
        if value.translation.width < 0 {
            if item.isSwiped {
                item.offset = value.translation.width - 90
            } else {
                item.offset = value.translation.width
            }
        }
    }

    func onEnd(value: DragGesture.Value) {
        withAnimation(.easeOut) {
            if value.translation.width < 0 {
                if -value.translation.width > UIScreen.main.bounds.width / 2 {
                    item.offset = -1000
                    deleteItem()

                } else if -item.offset > 50 {
                    item.isSwiped = true
                    item.offset = -90

                } else {
                    item.isSwiped = false
                    item.offset = 0
                }
            }
            else {
                item.isSwiped = false
                item.offset = 0
            }
        }
    }

    func deleteItem() {
        items.removeAll() { (item) -> Bool in
            return self.item.id == item.id
        }
    }
}

//struct ItemView_Previews: PreviewProvider {
//    @State static var item = Item(name: "Product 1", details: "product 1", image: "cloth-1", price: 30.05, quantity: 2, offset: 0, isSwiped: false)
//    static var previews: some View {
//        ItemView(item: $item)
//    }
//}


func getPrice(value: Float) -> String {
    let format = NumberFormatter()
    format.numberStyle = .currency

    return format.string(from: NSNumber(value: value)) ?? ""
}

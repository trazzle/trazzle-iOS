//
//  SnapCarouselView.swift
//  Trazzle
//
//  Created by 홍주연 on 4/10/24.
//
// https://www.youtube.com/watch?v=4Gw5lDXJ04g

import SwiftUI

struct SnapCarouselView<Content: View, T: Identifiable>: View {
    
    var content: (T) -> Content
    var list: [T]
    
    // properties
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    
    init(spacing: CGFloat = 8, trailingSpace: CGFloat = 100,
         index: Binding<Int>, items: [T],
         @ViewBuilder content: @escaping (T) -> Content ) {
        self.content = content
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
    }
    
    // Gesture offset
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    var body: some View {
        GeometryReader { proxy in
            
            // setting correct width
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustmentWidth = (trailingSpace / 2) - spacing
            
            HStack(spacing: spacing) {
                ForEach(list) { item in
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                }
            }
            .padding(.horizontal, spacing)
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustmentWidth : 0) + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                    out = value.translation.width
                })
                .onEnded({ value in
                    // update current Index
                    let offsetX = value.translation.width
                    //convert the transition into progress 0-1
                    // and round the value
                    // based on the progress increasing or decreasing the currentindex
                    let progress = -offsetX / width
                    let roundIndex = progress.rounded()
                    
                    // setting min index
                    currentIndex  = max(min(currentIndex + Int(roundIndex), list.count - 2), 0)
                    
                    // update index
                    currentIndex = index
                })
                .onChanged({value in
                    // update current Index
                    let offsetX = value.translation.width
                    //convert the transition into progress 0-1
                    // and round the value
                    // based on the progress increasing or decreasing the currentindex
                    let progress = -offsetX / width
                    let roundIndex = progress.rounded()
                    
                    // update only index
                    index = max(min(currentIndex + Int(roundIndex), list.count - 2), 0)
                })
            )
        }
        // animate when offset is zero
        .animation(.easeOut, value: offset == 0)
    }
}

//#Preview {
//    RecordImageSlideView()
//}

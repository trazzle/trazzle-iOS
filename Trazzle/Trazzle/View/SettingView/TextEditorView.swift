//
//  TextView.swift
//  Trazzle
//
//  Created by 연승주 on 4/15/24.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    
    @Binding var text: String
    
    public func makeUIView(context: UIViewRepresentableContext<TextView>) -> UITextView {
        let textView = WrappedTextView()
        textView.backgroundColor = .clear
        textView.isScrollEnabled = false
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        textView.textColor = .black
        textView.returnKeyType = .done
        textView.delegate = context.coordinator
        return textView
    }
    
    public func updateUIView(_ uiView: UITextView, context: Context) {
        print(#function)
        uiView.text = ""
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }
}

class WrappedTextView: UITextView {
    
    private var lastWidth: CGFloat = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.width != lastWidth {
            lastWidth = bounds.width
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let size = sizeThatFits(
            CGSize(width: lastWidth, height: UIView.layoutFittingExpandedSize.height))
        return CGSize(width: size.width.rounded(.up), height: size.height.rounded(.up))
    }
}

class Coordinator: NSObject, UITextViewDelegate {
    @Binding private var text: String
    
    init(text: Binding<String>) {
        self._text = text
    }
    
    // isEditing값을 변경합니다.
    func textViewDidBeginEditing(_ textView: UITextView) {
        print(#function)
        textView.text = text
        textView.textColor = UIColor(Color.g500)
        textView.font = .systemFont(ofSize: 14, weight: .regular)
    }
    
    // isEditing값을 변경합니다.
    func textViewDidEndEditing(_ textView: UITextView) {
        print(#function)
    }
    
    // 사용자가 텍스트 필드의 텍스트를 선택할 때 커서 위치를 변경합니다.
    func textViewDidChange(_ textView: UITextView) {
        
    }
    
    // 커서를 단위 앞으로 이동합니다.
    func setCursorPosition(_ textView: UITextView) {
        print(#function)
    }
}

//
//  CustomTextView.swift
//  Trazzle
//
//  Created by 홍주연 on 4/16/24.
//

import SwiftUI

public struct CustomTextView: UIViewRepresentable {
    @Binding var text: String
    @Binding var height: CGFloat
    var maxHeight: CGFloat
    var textFont: UIFont
    var textColor: UIColor = .black
    var textLimit: Int = 50
    var cornerRadius: CGFloat? = nil
    var borderWidth: CGFloat? = nil
    var borderColor: CGColor? = nil
    var isScrollEnabled: Bool = true
    var isEditable: Bool = true
    var isUserInteractionEnabled: Bool = true
    var lineFragmentPadding: CGFloat = 0
    var textContainerInset: UIEdgeInsets = .zero
    var placeholder: String? = nil
    var placeholderColor: UIColor = .gray
    
    public func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        if let cornerRadius = cornerRadius {
            textView.layer.cornerRadius = cornerRadius
            textView.layer.masksToBounds = true
        }
        if let borderWidth = borderWidth {
            textView.layer.borderWidth = borderWidth
        }
        if let borderColor = borderColor {
            textView.layer.borderColor = borderColor
        }
        if let placeholder = placeholder {
            textView.text = placeholder
            textView.textColor = placeholderColor
        } else {
            textView.textColor = textColor
        }
        
        textView.backgroundColor = .clear
        
        textView.font = textFont
        textView.isScrollEnabled = isScrollEnabled
        textView.isEditable = isEditable
        textView.isUserInteractionEnabled = isUserInteractionEnabled
        textView.textContainer.lineFragmentPadding = lineFragmentPadding
        textView.textContainerInset = textContainerInset
        textView.delegate = context.coordinator
        textView.returnKeyType = .done
//        textView.becomeFirstResponder()
        
        return textView
    }
    
    public func updateUIView(_ uiView: UITextView, context: Context) {
        updateHeight(uiView)
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    private func updateHeight(_ uiView: UITextView) {
        let size = uiView.sizeThatFits(CGSize(width: uiView.frame.width, height: .infinity))
        DispatchQueue.main.async {
            if size.height <= maxHeight {
                height = size.height
            }
        }
    }
    
    public class Coordinator: NSObject, UITextViewDelegate {
        var parent: CustomTextView
        
        init(parent: CustomTextView) {
            self.parent = parent
        }
        
        public func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
            
            if textView.text.isEmpty {
                textView.textColor = parent.placeholderColor
            } else {
                textView.textColor = parent.textColor
            }
            
            if textView.text.count > parent.textLimit - 1 {
                textView.text.removeLast()
            }
            
            parent.updateHeight(textView)
        }
        
        public func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.text == parent.placeholder {
                textView.text = ""
            }
        }
        
        public func textView(_ textView: UITextView,
                             shouldChangeTextIn range: NSRange,
                             replacementText text: String) -> Bool {
            if (text == "\n") {
                print("키보드 내려가요!")
                textView.resignFirstResponder()
            }
            return true
            
        }
        
        public func textViewDidEndEditing(_ textView: UITextView) {
            print(#function)
            if textView.text.isEmpty {
                textView.text = parent.placeholder
            }
        }
        
        public func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
            print(#function)
            textView.resignFirstResponder()
            return true
        }
    }
}

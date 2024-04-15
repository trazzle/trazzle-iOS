//
//  MultiTextField.swift
//  Trazzle
//
//  Created by 홍주연 on 4/15/24.


import SwiftUI
import UIKit

struct MultiTextField: UIViewRepresentable {
    
    @Binding var isEditing: Bool
    @Binding var text: String
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MultiTextField>) -> UITextView {
        let textField = UITextView()
        textField.backgroundColor = .clear
        textField.text = "type something"
        textField.font = .systemFont(ofSize: 14, weight: .regular)
        textField.textColor = UIColor(Color.g500).withAlphaComponent(0.3)
        textField.returnKeyType = .done
        textField.delegate = context.coordinator
        
        // 툴바를 제공합니다.
        //        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        //        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        //        let doneButton = UIBarButtonItem(
        //            barButtonSystemItem: .done,
        //            target: self,
        //            action: #selector(textField.didTapDoneButton)
        ////        )
        //        toolbar.items = [flexSpace, doneButton]
        //        textField.inputAccessoryView = toolbar
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiTextField>) {
        uiView.text = ""
        
        // 텍스트 필드의 포커스 위치를 변경합니다.
//        context.coordinator.setCursorPosition(uiView)
        
        // isEditing값에 따라 텍스트 필드의 포커스 상태를 변경합니다.
        if isEditing, !uiView.isFirstResponder {
            uiView.becomeFirstResponder()
        } else if !isEditing, uiView.isFirstResponder {
            uiView.resignFirstResponder()
        }
    }
}

//class Coordinator: NSObject, UITextViewDelegate {
//    @Binding private var isEditing: Bool
//    @Binding private var text: String
//    
//    init(isEditing: Binding<Bool>, text: Binding<String>) {
//        self._isEditing = isEditing
//        self._text = text
//    }
//    
//    // 텍스트가 입력될 때마다 단위를 함께 노출합니다.
//    //    func textField(_ textField: UITextField,
//    //                   shouldChangeCharactersIn range: NSRange,
//    //                   replacementString string: String) -> Bool {
//    //        ///
//    //
//    //    }
//    
//    // isEditing값을 변경합니다.
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if !isEditing {
//            isEditing = true
//        }
//        textView.text = ""
//        textView.textColor = UIColor(Color.g500)
//        textView.font = .systemFont(ofSize: 14, weight: .regular)
//    }
//    
//    // isEditing값을 변경합니다.
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if isEditing {
//            isEditing = false
//        }
//    }
//    
//    // 사용자가 텍스트 필드의 텍스트를 선택할 때 커서 위치를 변경합니다.
//    func textViewDidChange(_ textView: UITextView) {
//        //        setCursorPosition(textField)
//    }
//    
//    // 커서를 단위 앞으로 이동합니다.
//    func setCursorPosition(_ textView: UITextView) {
//        //
//    }
//}

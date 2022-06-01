//
//  HalfSheetModal.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/02.
//

import SwiftUI

// Custom Half Sheet Modifier....
extension View {
    // Binding Show Variable...
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheetView: @escaping () -> SheetView, onEnd: @escaping () -> Void ) -> some View {
        
        // why we using overlay or background...
        // bcz it will automatically use the swiftui frame Size only....
        return self
            .background(
                HalfSheetHelper(sheetView: sheetView(), showSheet: showSheet, onEnd: onEnd)
            )
            .onChange(of: showSheet.wrappedValue) { newValue in
                if !newValue {
                    onEnd()
                }
            }
    }
}

// UIKit Integration...
struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
    
    var sheetView: SheetView
    @Binding var showSheet: Bool
    var onEnd: () -> Void
    
    let controller = UIViewController()
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        controller.view.backgroundColor = .clear
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
        if showSheet {
            if uiViewController.presentedViewController == nil {
                
                // presenting Modal View....
                
                let sheetController = CustomHostingController(rootView: sheetView)
                sheetController.presentationController?.delegate = context.coordinator
                uiViewController.present(sheetController, animated: true)
            }
        } else {
            // closing view when showSheet toggled again...
            if uiViewController.presentedViewController != nil {
                uiViewController.dismiss(animated: true)
            }
        }
    }
    
    // On Dismiss...
    class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        
        var parent: HalfSheetHelper
        
        init(parent: HalfSheetHelper) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            parent.showSheet = false
        }
    }
}

// Custom UIHostingController for halfSheet....
class CustomHostingController<Content: View>: UIHostingController<Content> {
    
    override func viewDidLoad() {
        
        // setting presentation controller properties...
        if let presentationController = presentationController as? UISheetPresentationController {
            
            presentationController.detents = [
                
                .medium(),
                .large()
            ]
            
            // to show grab protion...
            presentationController.prefersGrabberVisible = true
        }
    }
}

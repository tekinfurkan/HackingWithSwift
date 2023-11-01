//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Furkan on 1.11.2023.

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
// Delegate of PHPickerViewController
    class Coordinator:NSObject, PHPickerViewControllerDelegate {
        // The function which responds the events occur on PHPickerViewController
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            // Dismiss the picker.
            picker.dismiss(animated: true)

            // Exit if no selection was made
            guard let provider = results.first?.itemProvider else { return }

            // If this has an image we can use, use it
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
        
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
    }
    
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

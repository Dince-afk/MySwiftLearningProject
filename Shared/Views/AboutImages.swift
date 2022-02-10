//
//  AboutImages.swift
//  MySwiftUI
//
//  Created by Dino Curic on 14.11.21.
//

import SwiftUI

struct AboutImages: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

// MARK: - Async Image
struct AsyncImagesLesson: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://hdthomas.com/images/dog@2x.webp")) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .scaledToFit()
            case .failure:
                Image(systemName: "photo")
            @unknown default:
                EmptyView()
            }
        }
    }
}


struct AboutImages_Previews: PreviewProvider {
    static var previews: some View {
        AboutImages()
        AsyncImagesLesson()
    }
}

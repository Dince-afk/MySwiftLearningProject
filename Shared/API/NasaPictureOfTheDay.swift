//
//  NasaPictureOfTheDay.swift
//  MySwiftUI
//
//  Created by Dino Curic on 20.11.21.
//

import SwiftUI

// Data Model for Nasa Picture of the Day Data
struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    // Custom coding keys
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
    
    static func fetchPhoto(completion: @escaping (Result< PhotoInfo, Error>) -> Void) {
        // Creating the URL for API call
        var urlComponents = URLComponents(string: "https://api.nasa.gov/planetary/apod")!
        
        // Dynamic code to append query arguments
        urlComponents.queryItems = [
            "api_key": "YZYfB9yZc8237GoljgLBUUeaTeEL8SIciwMctTb8",
        ].map {URLQueryItem(name: $0.key, value: $0.value) }
        
        // Create a URLSessions object with a data task
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            let jsonDecoder = JSONDecoder()
            if let data = data {
                do {
                    let photoInfo = try jsonDecoder.decode(PhotoInfo.self
                                                           , from: data)
                    completion(.success(photoInfo))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        // Actually starting it
        task.resume()
    }
}

struct NasaPictureOfTheDay: View {
    @State private var currentPhotoInfo = PhotoInfo(title: "This is a title", description: "This is a titleThis is a titleThis is a titleThis is a titleThis is a title", url: URL(fileURLWithPath: "test"), copyright: "none")
    @State private var didFinishLoadingPhotoInfo = false
    
    var body: some View {
        ScrollView {
            AsyncImage(url: currentPhotoInfo.url) { phase in
                switch phase {
                case .empty:
                    EmptyView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            }
            VStack {
                Text(currentPhotoInfo.title)
                    .font(.title)
                //                .redacted(reason: .placeholder)
                Text(currentPhotoInfo.description)
                //                .redacted(reason: .placeholder)
            }
            .padding()
            
            
        }
        .onAppear { PhotoInfo.fetchPhoto { result in
            switch result {
            case .success(let photoInfo):
                print("Fetch Photo succeded: \(photoInfo)")
                currentPhotoInfo = photoInfo
            case .failure(let error):
                print("Fetch Photo Failed with Error: \(error)")
            }
            
        } }
    }
}

struct NasaPictureOfTheDay_Previews: PreviewProvider {
    static var previews: some View {
        NasaPictureOfTheDay()
    }
}

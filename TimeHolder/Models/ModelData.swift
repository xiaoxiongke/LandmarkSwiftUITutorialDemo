//
//  ModelData.swift
//  TimeHolder
//
//  Created by 向宇涛 on 2021/2/8.
//

import Foundation
import ImageIO
import SwiftUI


final class ModelData: ObservableObject{
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
    var hikeData: [Hike] = load("hikeData.json")
    
    var features: [Landmark]{
        landmarks.filter{ $0.isFeatured }
    }
    
    @Published var profile = Profile.default
    
    var categories: [String: [Landmark]]{
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }

}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

final class ImageStore{
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]
    
    fileprivate static var scale = 2
    
    // share instance
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(verbatim: name))
    }
    
    static func loadImage(name: String) -> CGImage{
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
            else {
                fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) ->_ImageDictionary.Index{
        if let index = images.index(forKey: name) { return index }
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}

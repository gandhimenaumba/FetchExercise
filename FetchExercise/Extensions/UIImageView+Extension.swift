//
//  UIImageView+Extension.swift
//  FetchExercise
//
//  Created by gandhi mena on 11/9/23.
//

import UIKit

extension UIImageView {
    func load(url: URL, placeholder: UIImage?, cache: URLCache? = nil) {
        let cache = cache ??  URLCache.shared
        let request = URLRequest(url: url)
        if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            self.image = image
        } else {
            self.image = placeholder
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data,
                   let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300,
                   let image = UIImage(data: data) {
                    let cacheData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cacheData, for: request)
                    self.image = image
                }
            }.resume()
        }
    }
}

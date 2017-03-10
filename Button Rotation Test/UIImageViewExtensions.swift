//
//  UIImageViewExtensions.swift
//  EMobileView
//
//  Created by Yung Dai on 2017-02-09.
//  Copyright © 2017 Yung Dai. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView {
    
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    
     func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        DispatchQueue.main.async {
         self.downloadedFrom(url: url, contentMode: mode)
        }
        
    }
}

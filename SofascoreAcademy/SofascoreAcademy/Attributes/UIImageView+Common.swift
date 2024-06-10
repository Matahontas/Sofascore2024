//
//  UIImageView+Common.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 07.05.2024..
//

import Foundation
import UIKit

extension UIImageView {
    private static let imageCache = NSCache<NSString, UIImage>()

    func imageFromServerURL(_ URLString: String, placeHolder: UIImage?) { 
        self.image = nil
        let imageServerUrl = URLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        if let url = URL(string: imageServerUrl) {
            if let cachedImage = UIImageView.imageCache.object(forKey: NSString(string: imageServerUrl)) { 
                self.image = cachedImage
            } else {
                URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                    if error != nil {
                        print("ERROR LOADING IMAGES FROM URL: \(String(describing: error))")
                        DispatchQueue.main.async { [weak self] in
                            self?.image = placeHolder
                        }
                    } else if let data = data, let downloadedImage = UIImage(data: data) {
                        UIImageView.imageCache.setObject(downloadedImage, forKey: NSString(string: imageServerUrl))
                        DispatchQueue.main.async { [weak self] in
                            self?.image = downloadedImage
                        }
                    }
                }).resume()
            }
        }
    }
}

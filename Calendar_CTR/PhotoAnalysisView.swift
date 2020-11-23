//
//  PhotoAnalysisView.swift
//  Calendar_CTR
//
//  Created by 龚敬洋 on 2020/11/23.
//

import SwiftUI
import Photos

var images = [UIImage]()
struct PhotoAnalysisView: View {
    @State private var date = Date()
    var body: some View {
        VStack {
            Text("\(images.count)")
            Button(action: {
                initAnalysis()
            }) {
                Text("开始分析")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10.0).stroke(Color.black, lineWidth: 2.0))
            }
        }
    }
}

func initAnalysis(){
    let manager = PHImageManager.default()
    let requestOptions = PHImageRequestOptions()
    requestOptions.isSynchronous = false
    requestOptions.deliveryMode = .fastFormat
    let fetchOptions = PHFetchOptions()
    fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
    let result: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
    if(result.count > 0){
        for i in 0..<result.count {
            let asset = result.object(at: i)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd-HH-mm-ss"
            if(asset.creationDate != nil){
                let cdStr = dateFormatter.string(from: asset.creationDate!)
                if(cdStr > "2009-01-01-00-00-00"){
                    let size = CGSize(width: 700, height: 700)
                    manager.requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: requestOptions){
                        (image, _) in if let image = image {
                            images.append(image)
                        }
                    }
                }
            }
        }
    }
}

struct PhotoAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoAnalysisView()
    }
}

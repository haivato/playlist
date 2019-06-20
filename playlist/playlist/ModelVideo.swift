//
//  ModelVideo.swift
//  playlist
//
//  Created by HaiPhan on 5/16/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import Foundation
import Alamofire

protocol ModelVideoDeleGate {
    func getdata()
}

class ModelVideo {
    var mangvideo: [Video] = [Video]()
    var delegate: ModelVideoDeleGate!
    func getapivideo(){
        Alamofire.request("https://www.googleapis.com/youtube/v3/playlistItems", method: .get, parameters: ["part": "snippet", "playlistId": "PL4482C3F4C3F5CE63", "key": "AIzaSyBHcvsnaZU6uo6H3RO1FlEXuHiAwvZQ8bo", "maxResults": 20], encoding: URLEncoding.default, headers: nil).responseJSON { (res) in
             let json = res.result.value as! [String:Any]
            print(json)
            if json != nil {
                let items = json["items"] as! NSArray
                var mangtemp: [Video] = [Video]()
                for i in items {
                    var videoobject : Video = Video()
                    let snippet: NSDictionary = (i as! NSDictionary).value(forKey: "snippet") as! NSDictionary
                    let des = snippet["description"] as! String
                    let resourceId = snippet["resourceId"] as! [String:Any]
                    let videoId = resourceId["videoId"] as! String
                    let thumbnails = snippet["thumbnails"] as! [String:Any]
                    let maxres = thumbnails["default"] as! [String:Any]
                    let url = maxres["url"] as! String
                    let title = snippet["title"] as! String
                    videoobject.videodes = des
                    videoobject.videoid = videoId
                    videoobject.videothumbnail = url
                    videoobject.videotitle = title
                    mangtemp.append(videoobject)
                    for i in 0...mangtemp.count - 1{
                        print(mangtemp[i].videoid)
                        print(mangtemp[i].videoid)
                    }
                }
                self.mangvideo = mangtemp
                if self.delegate != nil {
                    self.delegate.getdata()
                }
            }

        }
    }
    func getvideo() -> [Video]{
        var mangvideo: [Video] = [Video]()
        
        let video1: Video = Video(videoid: "pFSQh_5QE40", videotitle: "LỚN RỒI CÒN KHÓC NHÈ ( MV ) | TRÚC NHÂN (#LRCKN)", videodes: "#lonroiconkhocnhe  #LRCKN  #trucnhan #callmomchallenge #callmom", videothumbnail: "https://img.youtube.com/vi/7xUSH1QLHzk/maxresdefault.jpg")
        let video2: Video = Video(videoid: "FuXNumBwDOM", videotitle: "Taylor Swift - ME! (feat. Brendon Urie of Panic! At The Disco)", videodes: "Music video by Taylor Swift performing ME! (feat. Brendon Urie of Panic! At The Disco). Download ", videothumbnail: "https://img.youtube.com/vi/7xUSH1QLHzk/maxresdefault.jpg")
        let video3: Video = Video(videoid: "kOHB85vDuow", videotitle: "TWICE M/V", videodes: "Spotify  https://tinyurl.com/yyz4rlwa", videothumbnail: "https://img.youtube.com/vi/7xUSH1QLHzk/maxresdefault.jpg")
        mangvideo.append(video1)
        mangvideo.append(video2)
        mangvideo.append(video3)
        return mangvideo
    }
}

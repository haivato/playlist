//
//  Video.swift
//  playlist
//
//  Created by HaiPhan on 5/16/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import Foundation

struct Video {
    var videoid: String?
    var videotitle: String?
    var videodes: String?
    var videothumbnail: String?
    init() {
        self.videodes = ""
        self.videoid = ""
        self.videotitle = ""
        self.videothumbnail = ""
    }
    init(videoid: String, videotitle: String, videodes: String, videothumbnail: String) {
        self.videodes = videodes
        self.videoid = videoid
        self.videotitle = videotitle
        self.videothumbnail = videothumbnail
    }
}

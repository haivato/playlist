//
//  videodetail.swift
//  playlist
//
//  Created by HaiPhan on 5/16/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class videodetail: UIViewController {

    @IBOutlet weak var lbldes: UILabel!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var wbdetail: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lbldes.text = detail.videodes
        lbltitle.text = detail.videotitle
        wbdetail.loadHTMLString("<html><body><p><iframe frameBorder=\"0\" height=\"200\" width=\"400\" src=\"http://www.youtube.com/embed/" + detail.videoid! + "?showinfo=0&modestbranding=1&frameborder=0&rel=0\"></iframe></p></body></html>", baseURL: nil)
    }


}

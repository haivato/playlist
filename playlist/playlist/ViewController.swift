//
//  ViewController.swift
//  playlist
//
//  Created by HaiPhan on 5/16/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

var detail: Video!

class ViewController: UIViewController, ModelVideoDeleGate {
    func getdata() {
        self.arrayVideo = modelvideo.mangvideo
        self.tbplay.reloadData()
        print(self.arrayVideo.count)
    }
    

    @IBOutlet weak var tbplay: UITableView!
    var arrayVideo: [Video] = [Video]()
    var modelvideo: ModelVideo! = ModelVideo()
    override func viewDidLoad() {
        super.viewDidLoad()
        tbplay.delegate = self
        tbplay.dataSource = self
        modelvideo.delegate = self
        modelvideo.getapivideo()
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayVideo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbplay.dequeueReusableCell(withIdentifier: "cell")
        let title = cell?.viewWithTag(2) as! UILabel
        title.text = arrayVideo[indexPath.row].videotitle
        let image = cell?.viewWithTag(1) as! UIImageView
        let string = arrayVideo[indexPath.row].videothumbnail
        let url = URL(string: string!)
        let data = try? Data(contentsOf: url!)
        image.image = UIImage(data: data!)
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detail = arrayVideo[indexPath.row]
    }
    
    
}


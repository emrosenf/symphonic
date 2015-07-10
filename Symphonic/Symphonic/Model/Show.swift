//
// Created by Makar Stetsenko on 09.07.15.
// Copyright (c) 2015 Avocado Hills. All rights reserved.
//

import Foundation

enum Type {
    case Opera, Theater
}

class Show {
    let id: Int
    let name: String
    let imageName: String
    let dates: [NSDate]
    let descr: String

    let type: Type

    init(id: Int, name: String, imageName: String, dates: [NSDate], description: String, type: Type) {
        self.id   = id
        self.name = name
        self.imageName = imageName
        self.dates = dates
        self.descr = description
        self.type = type
    }

    class func getShowList() -> [Show] {
        var shows = [Show]()

        var path  = NSBundle.mainBundle().pathForResource("shows", ofType: "plist")
        let data  = NSArray(contentsOfFile: path!)

        for showData in data! {
            let id          = showData["id"] as! Int
            let name        = showData["name"] as! String
            let imageName   = showData["image"] as! String
            let description = showData["description"] as! String
            let dates = showData["dates"] as! [NSDate]

            let show = Show(id: id, name: name, imageName: imageName, dates: dates, description: description, type: Type.Opera)
            shows.append(show)
        }

        return shows
    }

}

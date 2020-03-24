import UIKit

class Model: NSObject {
    var imageTitle:String = ""
    var imageAuthor:String = ""
    var imageYear:String = ""
    
    init(title:String,author:String,year:String) {
        self.imageTitle = title
        self.imageAuthor = author
        self.imageYear = year
    }
    
    class func generateModelArray() -> [Model]{
        var modelAry = [Model]()
        
        modelAry.append(Model(title: "Calculus 1", author: "James Stewart", year: "2012"))
        modelAry.append(Model(title: "Computer Science", author: "J. Glenn Brookshear", year: "2019"))
        modelAry.append(Model(title: "History", author: "HMH Social Studies", year: "2007"))
        modelAry.append(Model(title: "Philosophy", author: "Robert C. Solomon", year: "2008"))
        modelAry.append(Model(title: "Psychology", author: "Jeffrey S. Nevid", year: "2015"))
        
        return modelAry
    }
}

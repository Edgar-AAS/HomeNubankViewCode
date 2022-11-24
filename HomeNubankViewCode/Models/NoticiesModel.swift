import UIKit

class NoticiesModel {
    let newsImageName: String
    let newsTextLabel: String
    let descriptionTextLabel: String
    let buttonTitle: String
    
    init(newsImageName: String, newsTextLabel: String, descriptionTextLabel: String, buttonTitle: String) {
        self.newsImageName = newsImageName
        self.newsTextLabel = newsTextLabel
        self.descriptionTextLabel = descriptionTextLabel
        self.buttonTitle = buttonTitle
    }
    
    convenience init(newsImageName: String, newsTextLabel: String, descriptionTextLabel: String) {
        self.init(newsImageName: newsImageName, newsTextLabel: newsTextLabel, descriptionTextLabel: descriptionTextLabel, buttonTitle: "Conhecer")
    }
    
}

import Foundation

final class NoticiesViewModel {
    private let noticiesArray: [NoticiesModel] = [
        NoticiesModel(newsImageName: "NubankImage1", newsTextLabel: "Nubank Celular Seguro", descriptionTextLabel: "100% cobertura, 0% estresse. Simule agora mesmo."),
        NoticiesModel(newsImageName: "NubankImage2", newsTextLabel: "Seguro de vida", descriptionTextLabel: "Um seguro facil de contratar e que cabe no seu bolso."),
        NoticiesModel(newsImageName: "NubankImage3", newsTextLabel: "Caixinhas do Nubank", descriptionTextLabel: "Uma nova forma de guardar dinheiro para seus objetivos.", buttonTitle: "Saiba Mais"),
        NoticiesModel(newsImageName: "NubankImage4", newsTextLabel: "Portabilidade de salário", descriptionTextLabel: "Liberdade e escolher onde receber seu dinheiro.")
    ]
    
    func getCurrentNoticie(indexPath: IndexPath) -> NoticiesModel {
        return noticiesArray[indexPath.row]
    }
    
    func getCount() -> Int {
        return noticiesArray.count
    }
}

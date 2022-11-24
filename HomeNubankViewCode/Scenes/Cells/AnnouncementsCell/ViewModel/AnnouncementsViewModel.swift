import Foundation

final class AnnouncementsViewModel {
    private let announcementsArray: [AnnouncementsModel] = [
        AnnouncementsModel(announcementDescription: "Seguro de Vida a partir de R$4/mês? Conheça o Nubank Vida!"),
        AnnouncementsModel(announcementDescription: "Salve amigos da burocracia. Faça um convite para o Nubank."),
    ]
    
    func getCount() -> Int {
        return announcementsArray.count
    }
    
    func getCurrentAnnouncement(indexPath: IndexPath) -> AnnouncementsModel {
        return announcementsArray[indexPath.row]
    }
}

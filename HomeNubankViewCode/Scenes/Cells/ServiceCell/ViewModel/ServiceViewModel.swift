import Foundation

final class ServiceViewModel {
    private let serviceArray: [ServiceModel] = [
        ServiceModel(serviceImage: "square.grid.2x2", serviceName: "Área Pix"),
        ServiceModel(serviceImage: "barcode", serviceName: "Pagar"),
        ServiceModel(serviceImage: "square.and.arrow.down", serviceName: "Despositar"),
        ServiceModel(serviceImage: "iphone", serviceName: "Recarga de celular"),
        ServiceModel(serviceImage: "dollarsign.square", serviceName: "Cobrar"),
        ServiceModel(serviceImage: "heart", serviceName: "Doação"),
        ServiceModel(serviceImage: "globe", serviceName: "Transferir internac."),
        ServiceModel(serviceImage: "chart.bar", serviceName: "Investir"),
    ]
    
    func getCurrentService(indexPath: IndexPath) -> ServiceModel {
        return serviceArray[indexPath.row]
    }
    
    func getCount() -> Int {
        return serviceArray.count
    }
}

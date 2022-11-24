import Foundation

protocol CodeView {
    func buildViewHierarchy()
    func setupConstrains()
    func setupAdditionalConfiguration()
}

extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstrains()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration() {}
}


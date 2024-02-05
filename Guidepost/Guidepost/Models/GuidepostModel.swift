
import Foundation
import CoreLocation

struct GuidepostModel:  Codable, Hashable, Identifiable {
    var id: UUID
    var title: String?
    var imgURL: String?
    var createDate: String?
    var locationLAT : String?
    var locationLONG : String?
    var tags: String?
}

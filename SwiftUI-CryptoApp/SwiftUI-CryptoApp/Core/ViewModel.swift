import Foundation
import Combine

class ViewModel: ObservableObject {
  var cancelBag = Set<AnyCancellable>()
}

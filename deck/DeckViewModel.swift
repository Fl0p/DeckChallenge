import SwiftUI
class DeckViewModel: ObservableObject {
    
    @Published var count: Int = 0
    @Published var lastItem: String = ""
    @Published var lastOpTime: Int = 0
    
    private var deck: Deck
    private var oper: Operator
    
    init() {
        deck = Deck()
        oper = OperatorImpl(
            tagMatcher: ExactTagMatcher(tag: 99)
        )
        op() {
            self.lastItem = "num=_ lastItem=" + (self.deck.items.last?.description ??  "")
        }
    }
    
    func op(_ closure: @escaping() -> Void) {
        let startTime = Date()
        closure()
        let endTime = Date()
        let elapsedTime = endTime.timeIntervalSince(startTime)
        count = deck.items.count
        lastOpTime = Int(elapsedTime*1000) // miliseconds
    }
    
    func make() {
        op() {
            for _ in 0..<100000 {
                self.deck.items.append(Item(rand: true))
            }
            self.lastItem = "num=_ lastItem=" + (self.deck.items.last?.description ?? "")
        }
    }

    func proc() {
        op() {
            let num = self.deck.items.reduce(0) { count, item in
                count + (self.oper.isTagMatch(item: item) ? 1 : 0)
            }
            self.lastItem = "num=\(num) lastItem=" + (self.oper.lastCompared?.description ?? "")
        }
    }

}

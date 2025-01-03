import Foundation

struct Inner {
    let kek: Int
    let lol: Int
    let aza: Int
    let qwe: Int
    let asd: Int
    let zxc: Int
    let str: String
}

struct Item: CustomStringConvertible {
    var id: String
    var tag: Int
    var inner: Inner
    init(rand: Bool = false) {
        if (rand) {
            let uuid = UUID().uuidString
            let rand = Int.random(in: 1...100)
            self.id = uuid
            self.tag = rand
            self.inner = Inner(
                kek: rand/2,
                lol: rand/3,
                aza: rand/4,
                qwe: rand/5,
                asd: rand/6,
                zxc: rand/7,
                str: uuid
            )
        } else {
            self.id = ""
            self.tag = 0
            self.inner = Inner(
                kek: 0,
                lol: 0,
                aza: 0,
                qwe: 0,
                asd: 0,
                zxc: 0,
                str: "")
        }
    }
    
    var description: String {
        return "Item: \(tag), \(id)"
    }
}

struct Deck {
    var items: [Item] = []
}

protocol LastCompared {
    var lastCompared: Item? { get }
}

protocol TagMatcher: LastCompared {
    func isTagMatch(item: Item) -> Bool
}

class ExactTagMatcher: TagMatcher {
    let tag: Int
    public private(set) var lastCompared: Item?
    init(tag: Int) {
        self.tag = tag
    }
    
    func isTagMatch(item: Item) -> Bool {
        lastCompared = item
        return item.tag == self.tag
    }
}

protocol Operator: TagMatcher, LastCompared {
    func isTagMatch(item: Item) -> Bool
}

class OperatorImpl: Operator {
    let tagMatcher: TagMatcher
    public private(set) var lastCompared: Item?
    
    init(tagMatcher: TagMatcher) {
        self.tagMatcher = tagMatcher
    }
    
    func isTagMatch(item: Item) -> Bool {
        self.lastCompared = item
        return self.tagMatcher.isTagMatch(item: item)
    }
  
}

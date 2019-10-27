import Cocoa

public struct Stack<T> {
    
    fileprivate var array = [T]()
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func push(_ item: T) {
        array.append(item)
    }
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public mutating func top() -> T? {
        return array.last
    }
}

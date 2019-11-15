import UIKit

public class BinarySearchTreeNode<T: Comparable> {
    
    //variables that reference other Nodes private set keeps the user from adding it incorrectly but let them look at it
    private (set) public var value: T
    
    private (set) public var parentNode: BinarySearchTreeNode?
    
    private (set) public var leftNode: BinarySearchTreeNode?
    
    private (set) public var rightNode: BinarySearchTreeNode?
    
    public init(value: T) {
        self.value = value
    }
    
    /// allows for an array to be used to create a BST
    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for value in array.dropFirst() {
            insert(value: value)
        }
    }
    
    ///Returns a boolian indicating if the value is the root node of the tree
    public var isRoot: Bool {
        return parentNode == nil
    }
    
    ///returns a boolian indicating if the value is at the bottom of the tree
    public var isLeaf: Bool {
        return leftNode == nil && rightNode == nil
    }
    
    public var isLeftChild: Bool {
        return parentNode?.leftNode === self
    }
    
    public var isRightChild: Bool {
        return parentNode?.rightNode === self
    }
    
    public var hasLeftChild: Bool {
        return leftNode != nil
    }
    
    public var hasRightChild: Bool {
        return rightNode != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren: Bool {
        return hasRightChild && hasLeftChild
    }
    
    public var count: Int {
        return(leftNode?.count ?? 0) + 1 + (rightNode?.count ?? 0)
    }
    
    public func insert(value: T) {
        if value < self.value {
            if let left = leftNode {
                left.insert(value: value)
            } else {
                leftNode = BinarySearchTreeNode(value: value)
                leftNode?.parentNode = self
            }
        }else {
            if let right = rightNode {
                right.insert(value: value)
            } else {
                rightNode = BinarySearchTreeNode(value: value)
                rightNode?.parentNode = self
            }
        }
    }
    
    /// Searches for a given value if duplicate values exist this will return the "Highest value"
    public func search(value: T) -> BinarySearchTreeNode? {
        if value < self.value {
            return leftNode?.search(value: value)
        } else if value > self.value {
            return rightNode?.search(value: value)
        } else {
            return self
        }
    }
    
    ///applies a function to the given BST
    public func traverseInOrder(process: (T) -> Void) {
        leftNode?.traverseInOrder(process: process)
        process(value)
        rightNode?.traverseInOrder(process: process)
    }
    
    private func reconnectParentTo(node: BinarySearchTreeNode?) {
        if let parent = parentNode {
            if isLeftChild {
                parent.leftNode = node
            } else {
                parent.rightNode = node
            }
            node?.parentNode = parentNode
        }
    }
    
    ///Finds the max value of the tree by tunnelling down the right side of the tree
    public func maximumValue() -> BinarySearchTreeNode {
        var node = self
        while let next = node.rightNode {
            node = next
        }
        return node
    }
    
    public func minimumValue() -> BinarySearchTreeNode {
        var node = self
        while let next = node.leftNode {
            node = next
        }
        return node
    }
    
    @discardableResult public func remove() -> BinarySearchTreeNode? {
        let replacement: BinarySearchTreeNode?
        if let right = rightNode {
            replacement = right.minimumValue()
        } else if let left = leftNode {
            replacement = left.maximumValue()
        } else {
            replacement = nil
        }
        replacement?.remove()
        replacement?.rightNode = rightNode
        replacement?.leftNode = leftNode
        rightNode?.parentNode = replacement
        leftNode?.parentNode = replacement
        reconnectParentTo(node: replacement)
        parentNode = nil
        leftNode = nil
        rightNode = nil
        return replacement
    }
    
    public func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(leftNode?.height() ?? 0, rightNode?.height() ?? 0)
        }
    }
}

let tree = BinarySearchTreeNode(array: [5,23,4,6,1,1,2,3,43,4,2,2,3,4,5,6,7,7,7])

let value = tree.search(value: 43)

if let val = value {
    print(val.value)
}


//now with a simple class

class Dog {
    let breed: String
    let name: String
    let age: Int
    
    init(name: String, breed: String, age: Int) {
        self.breed = breed
        self.name = name
        self.age = age
    }
    
}

extension Dog: Comparable {
    static func < (lhs: Dog, rhs: Dog) -> Bool {
        return lhs.age < rhs.age
    }
    
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        return lhs.age == rhs.age
    }
    
    
}

func createRandomDogs(howMany: Int) -> [Dog] {
    var array: [Dog] = []
    for _ in 0...howMany {
        let dog = Dog(name: UUID().uuidString, breed: UUID().uuidString, age: Int.random(in: 0...15))
            array.append(dog)
    }
    return array
}

let dogTree = BinarySearchTreeNode(array: createRandomDogs(howMany: 54))

print(dogTree.height())

let dog = dogTree.search(value: Dog(name: "bart", breed: "yeet", age: 4) )

//since the dogs age is random sometimes we will not find a dog but chances are low due to how many were creating

if let dog = dog {
    print(dog.value.age)
    print(dog.value.name)
} else {
    print("no dog found")
}


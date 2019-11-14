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
    
    
}



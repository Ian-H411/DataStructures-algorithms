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
    
    public var isRoot: Bool {
        return parentNode == nil
    }
    
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
    
}

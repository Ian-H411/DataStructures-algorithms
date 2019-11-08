import UIKit

//average sort complexity = N^2
//worst is the same

//space complexity is 1

//basic bubbleSort
func bubbleSort(array: [Int]) -> [Int]{
    var array = array
    for i in 0..<array.count {
        for j in 1..<array.count - i {
            if array[j] < array [j - 1] {
                let temporary = array[j - 1]
                array[j - 1] = array[j]
                array[j] = temporary
            }
        }
    }
    return array
}

print(bubbleSort(array: [9,920,5,7,4,3,56,9,5,3,21]))


//same theory but uses the swift swapat
func bubble2(array: [Int]) {
    var array = array
    for i in 0..<array.count {
        for j in 1..<array.count - i {
            if array[j] < array[j - 1] {
                array.swapAt(j, j - 1)
            }
        }
    }
    print(array)
}

bubble2(array: [3,4,2,1,3,5])

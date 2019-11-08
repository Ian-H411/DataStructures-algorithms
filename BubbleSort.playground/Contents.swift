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



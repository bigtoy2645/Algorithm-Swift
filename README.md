# Algorithm-Swift
Practice algorithms and data structures in Swift

## Int
### 자릿수 별로 배열에 담기
```
// 123 -> [1, 2, 3]
func solution(_ num: Int) -> [Int] {
    return String(num).map{ $0.hexDigitValue! }
}

// 123 -> [3, 2, 1]
func solution(_ num: Int) -> [Int] {
    return String(num).reversed().map{ $0.hexDigitValue! }
}
```

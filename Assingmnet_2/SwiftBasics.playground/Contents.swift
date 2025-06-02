import Foundation

// 1. Dataset: Array of Tuples
let students: [(name: String, grade: Int)] = [
    ("Alice", 85),
    ("Bob", 72),
    ("Charlie", 90),
    ("Diana", 65),
    ("Ethan", 78)
]

// 2. Function to calculate summary (max, min, average)
func gradeSummary(data: [(name: String, grade: Int)]) -> (max: Int, min: Int, average: Double) {
    let grades = data.map { $0.grade }
    let maxGrade = grades.max() ?? 0
    let minGrade = grades.min() ?? 0
    let averageGrade = Double(grades.reduce(0, +)) / Double(grades.count)
    return (max: maxGrade, min: minGrade, average: averageGrade)
}

// 3. Filter function using a closure (grades above 75)
let passingStudents = students.filter { $0.grade > 75 }

// 4. Print the results
let summary = gradeSummary(data: students)

print("Grade Summary:")
print("Highest Grade: \(summary.max)")
print("Lowest Grade: \(summary.min)")
print("Average Grade: \(String(format: "%.2f", summary.average))")

print("\n Students with Grades Above 75:")
for student in passingStudents {
    print("\(student.name): \(student.grade)")
}


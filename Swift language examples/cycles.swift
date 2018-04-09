//циклы
class Exercise {
    var date : String
    var mark: Int

    init(date: String, mark: Int) {
        self.date = date
        self.mark = mark
    }
}

func averageByStudent(dict: Dictionary<String, Array<Exercise>>) {
    for (name, exercises) in dict {
        var sum = 0
        var average = 0
        for exercise in exercises {
            sum+=exercise.mark
        }
        average = sum / exercises.count
        print("\(name) average: \(average)")
    }
}

func averageByGroup(dict: Dictionary<String, Array<Exercise>>) -> Float {
    var sum = 0
    var exercisesCount = 0
    for pair in dict {
        exercisesCount += pair.value.count
        for exercise in pair.value {
            sum += exercise.mark
        }
    }
    return Float(sum/exercisesCount)
}

var dictionary: Dictionary<String, Array<Exercise>> =
    ["Chehov": [Exercise(date: "13 July", mark: 8),Exercise(date: "14 July", mark: 4)],
     "Kuranets": [Exercise(date: "13 July", mark: 7), Exercise(date: "14 July", mark: 1)],
     "Shmelev": [Exercise(date: "13 July", mark: 8),Exercise(date: "14 July", mark: 5)]]

averageByStudent(dict: dictionary)
print(averageByGroup(dict: dictionary))


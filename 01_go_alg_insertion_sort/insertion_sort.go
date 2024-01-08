package main

import (
	"fmt"
	"sort"
)

type Person struct {
	Age  int
	Name string
}

func insertionSort(arr map[int]Person) []int {
	keys := make([]int, 0, len(arr))

	for key := range arr {
		keys = append(keys, key)
	}

	sort.Slice(keys, func(i, j int) bool {
		return arr[keys[i]].Age < arr[keys[j]].Age || (arr[keys[i]].Age == arr[keys[j]].Age && arr[keys[i]].Name < arr[keys[j]].Name)
	})

	return keys
}

func main() {
	data := map[int]Person{
		1: {Age: 30, Name: "Чайковский Николай"},
		2: {Age: 25, Name: "Попов Павел"},
		3: {Age: 30, Name: "Максимов Егор"},
		4: {Age: 25, Name: "Сон Артём"},
		5: {Age: 28, Name: "Лапотников Павел"},
		6: {Age: 28, Name: "Попов Петр"},
	}

	sortedKeys := insertionSort(data)

	for _, key := range sortedKeys {
		fmt.Printf("%d: %s (Age: %d)\n", key, data[key].Name, data[key].Age)
	}
}

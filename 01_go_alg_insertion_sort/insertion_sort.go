package main

import "fmt"

func insertionSort(arr map[int]string) {
	keys := make([]int, 0, len(arr))
	for key := range arr {
		keys = append(keys, key)
	}

	for i := 1; i < len(keys); i++ {
		j := i
		for j > 0 && keys[j] < keys[j-1] {
			keys[j], keys[j-1] = keys[j-1], keys[j]
			j--
		}
	}

	for _, key := range keys {
		fmt.Printf("%d: %s\n", key, arr[key])
	}
}

func main() {
	data := map[int]string{55: "Чайковский Николай", 21: "Попов Павел", 22: "Максимов Егор", 19: "Сон Артём", 7: "Лапотников Павел"}
	insertionSort(data)
}

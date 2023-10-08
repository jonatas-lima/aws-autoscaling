package main

import (
	"fmt"
	"log"
	"net/http"
	"strconv"
	"sync"
)

func main() {
	http.HandleFunc("/", StressCPU)
	http.HandleFunc("/health", HealthCheck)
	fmt.Println("api na porta: 8080")

	log.Fatal(http.ListenAndServe(":8080", nil))
}

func HealthCheck(w http.ResponseWriter, request *http.Request) {
	// faz nada
}

func StressCPU(w http.ResponseWriter, request *http.Request) {
	numThreads, err := strconv.Atoi(request.URL.Query().Get("n"))
	if err != nil {
		panic(err)
	}

	var wg sync.WaitGroup

	for i := 0; i < numThreads; i++ {
		wg.Add(1)
		go func() {
			r := 1
			for j := 1; j < 50; j++ {
				r = r * j
			}
			log.Println(r)
			wg.Done()
		}()
	}
	wg.Wait()
}

package main

import (
	"encoding/json"
	"fmt"
	"log"
	"math/rand"
	"net/http"
	"os"
	"strconv"
	"time"
)

func main() {
	http.HandleFunc("/users", getUsers)
	fmt.Println("api na porta: 8000")

	log.Fatal(http.ListenAndServe(":8000", nil))
}

type User struct {
	ID   int    `json:"id"`
	Name string `json:"nome"`
}

func getUsers(w http.ResponseWriter, request *http.Request) {
	if request.Method != "GET" {
		http.Error(w, http.StatusText(http.StatusMethodNotAllowed), http.StatusMethodNotAllowed)
		return
	}

	queryParams := request.URL.Query()
	paramValue := queryParams.Get("n")
	var n int
	var err error
	if paramValue != "" {
		n, err = strconv.Atoi(paramValue)
		if err != nil {
			http.Error(w, "Invalid parameter value", http.StatusBadRequest)
			return
		}
	}
	w.Header().Set("Content-Type", "application/json")
	rand.Seed(time.Now().UnixNano())
	var choosedUsers []User
	for i := 0; i < n; i++ {
		randomNumber := rand.Intn(500)
		users, err := readUsersFromFile("users.json")
		if err != nil {
			http.Error(w, "Erro ao ler os dados dos usuários", http.StatusInternalServerError)
			return
		}
		for _, user := range users {
			if user.ID == randomNumber {
				fmt.Println(user)
				choosedUsers = append(choosedUsers, user)
			}
		}
	}

	writeUsers(choosedUsers, w)
	json.NewEncoder(w).Encode(choosedUsers)
}

func writeUsers(users []User, w http.ResponseWriter) {
	file, err := os.Create("users.txt")
	if err != nil {
		fmt.Println("Erro ao criar o arquivo:", err)
		http.Error(w, "Erro ao criar o arquivo", http.StatusInternalServerError)
		return
	}

	for _, user := range users {
		_, err := file.WriteString(fmt.Sprintf("Nome: %s, Id: %d\n", user.Name, user.ID))
		if err != nil {
			fmt.Println("Erro ao escrever no arquivo:", err)
			http.Error(w, "Erro ao escrever no arquivo", http.StatusInternalServerError)
			return
		}
	}
	file.Close()
}

func readUsersFromFile(filename string) ([]User, error) {
	file, err := os.Open(filename)
	if err != nil {
		return nil, err
	}

	var users []User
	err = json.NewDecoder(file).Decode(&users)
	if err != nil {
		return nil, err
	}
	file.Close()
	return users, nil
}

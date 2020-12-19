package main

import (
	"net/http"
	"encoding/json"
	"fmt"
	"log"
)


type Article struct {
	Title   string `json:"Title"`
	Desc    string `json:"desc"`
	Content string `json:"content"`
}

type Articles []Article


func allArticles(w http.ResponseWriter, r *http.Request) {
	articles := Articles{
		Article{Title: "test title", Desc: "test desc", Content: "Hello Go!!"},
	}

	fmt.Println("Endpoint Hit: All Articles Endpoint")
	json.NewEncoder(w).Encode(articles)
}

func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Welcome to the HomePage!")
	fmt.Println("Endpoint Hit: homePage")
}


func handleRequests() {
	http.HandleFunc("/", homePage)
	http.HandleFunc("/articles", allArticles)
	log.Fatal(http.ListenAndServe(":5000", nil))
}


func main() {

	fmt.Println("Hllo world!!")

	handleRequests()
	//nil meaning unintialized
	err := http.ListenAndServe(":5000", nil)
	//something is wrong
	if err != nil {
		panic(err.Error())
	}

}




//eb init -p go vitals-tracker --region us-east-2
//eb deploy

////func indexHandler(w http.ResponseWriter, r *http.Request)
//vitals-tracker init -p go go-tutorial --region us-east-2

//env GOOS=linux GOARCH=arm go build -o bin/application application.go
//GOARCH=amd64 GOOS=linux go build -o bin/application main.go
//zip ../vitals-tracker.zip -r * .[^.]*
//go build -o bin/application main.go

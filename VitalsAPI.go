package main

import (
	"fmt"
	"log"
	"net/http"
)

func hello(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/" {
		http.Error(w, "404 not found.", http.StatusNotFound)
		return
	}

	switch r.Method {
	case "GET":
		http.ServeFile(w, r, "main.html")
	case "POST":
		// Call ParseForm() to parse the raw query and update r.PostForm and r.Form.
		if err := r.ParseForm(); err != nil {
			fmt.Fprintf(w, "ParseForm() err: %v", err)
			return
		}
		fmt.Fprintf(w, "Post from website! r.PostFrom = %v\n", r.PostForm)
		userID := r.FormValue("userID")
		secretKey := r.FormValue("secretKey")
		fullName := r.FormValue("fullName")
		dob := r.FormValue("dob")
		weight := r.FormValue("weight")
		address := r.FormValue("address")
		height := r.FormValue("height")
		fmt.Fprintf(w, "UserID = %s\n", userID)
		fmt.Fprintf(w, "SecretKey = %s\n", secretKey)
		fmt.Fprintf(w, "FullName = %s\n", fullName)
		fmt.Fprintf(w, "DOB = %s\n", dob)
		fmt.Fprintf(w, "Weight = %s\n", weight)
		fmt.Fprintf(w, "Address = %s\n", address)
		fmt.Fprintf(w, "Height = %s\n", height)
	default:
		fmt.Fprintf(w, "Sorry, only GET and POST methods are supported.")
	}
}

func main() {
	http.HandleFunc("/", hello)

	fmt.Printf("Starting server for testing HTTP POST...\n")
	if err := http.ListenAndServe(":10000", nil); err != nil {
		log.Fatal(err)
	}
}

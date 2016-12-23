package main

//import "fmt"
//import "github.com/go-martini/martini"
//import "http"

import (
	"github.com/go-martini/martini"
	"net/http"
)

func main() {
	m := martini.Classic()
	//m.Use(Auth)

	m.Get("/", func() string {
		return "Helllo world!"
	})

	m.Get("/hello/:name", Auth, func(params martini.Params) string {
		return "Hello " + params["name"]
	})

	m.NotFound(func(res http.ResponseWriter, req *http.Request) {
		//handle 404
		//fmt.Println("not found or something")
		//return 404
		http.Error(res, "not found or something", 404)
	})

	m.Run()
}

func Auth(res http.ResponseWriter, req *http.Request) {
	if req.Header.Get("API-KEY") != "secret123" {
		http.Error(res, "Nope", 401)
	}
}

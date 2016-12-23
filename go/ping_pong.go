package main

import "time"
import "fmt"

type Ball struct{ hits int }

func main() {
	table := make(chan *Ball)

	go player("ethan", table)
	go player("james", table)
	go player("jocelyn", table)

	table <- new(Ball)

	time.Sleep(2 * time.Second)

	<-table
}

func player(name string, table chan *Ball) {
	for {
		ball := <-table
		ball.hits++
		fmt.Println(name, ball.hits)
		time.Sleep(100 * time.Millisecond)

		table <- ball
	}
}

package main

import (
	"bytes"
	"flag"
	"fmt"
	"os"
)

/*
What do we need from the command line for this script to run?
    region
    from_cluster
    to_cluster
    environment

    buffer.WriteString("a")
    }

    fmt.Println(buffer.String())
*/

func main() {
	//	wordPtr := flag.String("word", "foo", "a string")
	region_ptr := flag.String("region", "us-east-1", "Region you want to check.")
	environment_ptr := flag.String("environment", "", "Environment you're checking connectivity in.")
	from_cluster_ptr := flag.String("from_cluster", "", "Name of the cluster the connection is coming from.")
	to_cluster_ptr := flag.String("to_cluster", "", "Name of the cluster you're checking connectivity to.")

	flag.Parse()

	var error bool

	var error_string bytes.Buffer
	error = false

	region := *region_ptr
	environment := *environment_ptr
	from_cluster := *from_cluster_ptr
	to_cluster := *to_cluster_ptr

	fmt.Println("Region:", region)
	fmt.Println("Environment:", environment)
	fmt.Println("From Cluster:", from_cluster)
	fmt.Println("To Cluster: ", to_cluster)

	if from_cluster == "" {
		error_string.WriteString("\tFrom cluster is empty!\n")
		error = true
	}

	if to_cluster == "" {
		error_string.WriteString("\tTo Cluster is empty!\n")
		error = true
	}

	if environment == "" {
		error_string.WriteString("\tEnvironment is empty!\n")
		error = true
	}

	if error {
		fmt.Println("There were error(s):")
		fmt.Println(error_string.String())
		os.Exit(1)
	}

	fmt.Print("blahblah")
}

package main

import (
	"fmt"
	"os"
	"path/filepath"
	"regexp"
)

func main() {
	//slices()
	listfiles()
}

//
//
//

func listfiles() {
	const testData = "../test_data/"
	pdfs, _ := regexp.Compile("(?i)pdf$")
	cwd, _ := os.Getwd()
	fmt.Printf("Starting from %s\n", cwd)
	files := make([]string, 0)
	err := filepath.Walk(
		testData,
		func(path string, info os.FileInfo, err error) error {
			if err != nil {
				fmt.Printf("ERROR: %q: %v\n", path, err)
				return err
			}
			/*if info.IsDir() {
				fmt.Printf("Skipping: %s\n", info.Name())
				return nil
			}*/
			// fmt.Print("Found regular file: %s\n", info.Name())
			if !info.IsDir() && pdfs.MatchString(path) {
				files = append(files, path)
			}
			return nil
		}, // Why is there a comma here?
	)
	if err != nil {
		fmt.Printf("We hit an error walking thru the filesystem.\n")
		return
	}
	//
	fmt.Printf("########################\n")
	for _, path := range files {
		fmt.Printf("\t%s\n", path)
	}
}

func slices() {
	coll := make([]string, 1)
	coll = append(coll, "this", "that", "the other", "another\n", "yet another")
	for _, thing := range coll {
		fmt.Printf("\t%s\n", thing)
	}
}

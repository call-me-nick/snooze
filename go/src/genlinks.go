package main

import (
	"bufio"
	"fmt"
	"os"
	"path/filepath"
	"regexp"
	"strings"

	"github.com/clagraff/argparse"
)

const invalidFilenameChars = "[:$(&!#;]"

func main() {
	args := cli()
	cwd, _ := os.Getwd()
	fmt.Println("Executing from:", cwd)
	targetDir := getTargetPath()
	pdfPaths := findPdfFiles(targetDir)
	findInvalidFilenames(pdfPaths)
	//printPaths(pdfPaths)
	outputCSV(pdfPaths)
}

/*
	Functions
*/

func outputCSV(pdfPaths []string) {
	var excelHyperlink string
	for _, path := range pdfPaths {
		excelHyperlink = "=HYPERLINK(\"" + path + "\",\"Link\")"
		fmt.Println(excelHyperlink)
	}
}

func findInvalidFilenames(pdfPaths []string) {
	var found bool = false
	badFile, _ := regexp.Compile(invalidFilenameChars)
	for _, path := range pdfPaths {
		if badFile.MatchString(path) {
			fmt.Println("Bad filename:", path)
			found = true
		}
	}
	if found {
		fmt.Println("The following cannot be in filenames: ", invalidFilenameChars)
		panic("Please repair the bad filenames.")
	}
}

func findPdfFiles(targetDir string) []string {
	pdfs, _ := regexp.Compile("(?i)pdf$")
	pdfPaths := make([]string, 0)
	err := filepath.Walk(
		targetDir,
		func(path string, info os.FileInfo, err error) error {
			if err != nil {
				fmt.Printf("ERROR: %q: %v\n", path, err)
				return err
			}
			if !info.IsDir() && pdfs.MatchString(path) {
				pdfPaths = append(pdfPaths, path)
				//fmt.Println("found:", path)
			}
			return nil
		}, // Why is there a comma here?
	)
	if err != nil {
		fmt.Println("Error walking filesystem.")
		panic(err)
	}
	return pdfPaths
}

func getTargetPath() string {
	//string targetDir
	reader := bufio.NewReader(os.Stdin)
	//
	fmt.Printf("Where should we run this? : ")
	targetDir, _ := reader.ReadString('\n')
	targetDir = strings.Replace(targetDir, "\n", "", -1)
	targetDir = strings.Replace(targetDir, "\r\n", "", -1) // or for Windows
	fmt.Println()
	return targetDir
}

func printPaths(pdfPaths []string) {
	for _, path := range pdfPaths {
		fmt.Println("\t", path)
	}
}

func cli() string {
	p := argparse.NewParser()
	p.AddHelp()
	opt

}

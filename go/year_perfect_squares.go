package main

import (
	"fmt"
	"math"
)

func main() {
	num_years := 100000
	num_years_perfect_square := 0

	for year := 0; year < num_years; year++ {
		square_root_float := math.Sqrt(float64(year))

		if float64(int(square_root_float)) == square_root_float {
			//			fmt.Printf("Year: %d. SQRT: %f, temp: %d\n", i, square_root_float, int(square_root_float))
			fmt.Printf("Year %d is a perfect square of %d\n", year, int(square_root_float))
			num_years_perfect_square++
		}
	}

	fmt.Printf("\nThere are %d years that are perfect squares between 0 and they year %d\n", num_years_perfect_square, num_years)
}

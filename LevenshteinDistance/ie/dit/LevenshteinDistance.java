// setting up a Matrix
package ie.dit;

import java.util.*;
import ie.dit.Matrix2D;

public class LevenshteinDistance {

	private String needle, haystack;

	private int nLen, hLen;

	public Matrix2D matrix;

	public LevenshteinDistance(String needle, String haystack) {

		this.needle = needle;
		this.haystack = haystack;

		matrix = new Matrix2D(needle.length() + 1, haystack.length() + 1);

		initialise();

	}

	public static int distance(String needle, String haystack) {

		LevenshteinDistance lDis = new LevenshteinDistance(needle, haystack);

		return lDis.distance();

	}

	private void initialise() {

		for(int col = 0; col < matrix.getCols(); col++) {

			matrix.setCell(0, col, col);

		}

		for(int row = 0; row < matrix.getRows(); row++) {

			matrix.setCell(row, 0, row);

		}


	}

	public int distance() {

		int ret;

		for(int row = 1; row < matrix.getRows(); row++) {

			for(int col = 1; col < matrix.getCols(); col++) {

				if(needle.charAt(row - 1) == haystack.charAt(col - 1)) {

					matrix.setCell(row, col, matrix.getCell(row - 1, col - 1));

				}
				else{

					matrix.setCell(row, col, minValue(row, col));
				}

			}

		}

		ret = (int)matrix.getCell(matrix.getRows() - 1, matrix.getCols() - 1);

		return ret;

	}

	private int minValue(int row, int col) {

		int min;

		int top = matrix.getCell(row - 1, col);
		int left = matrix.getCell(row, col - 1);
		int topLeft = matrix.getCell(row - 1, col - 1);

		if(top < left && top <= topLeft) {

			min = top;

		}
		else if(left < topLeft && left <= top) {

			min = left;
		}
		else {

			min = topLeft;

		}

		return min + 1;

	}

}
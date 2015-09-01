// setting up a Matrix
package ie.dit;

import java.util.*;
import ie.dit.Matrix2D;

public class LevenshteinDistance {

	private String needle, haystack;

	private int nLen, hLen;

	private Matrix2D matrix;

	public LevenshteinDistance(String needle, String haystack) {

		this.needle = needle;
		this.haystack = haystack;

		setUpMatrix();

		//matrix.initialise();

	}

	private void setUpMatrix() {

		matrix = new Matrix2D(needle.length(), haystack.length());

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

		for(int col = 1; col < matrix.getCols(); col++) {

			for(int row = 1; row < matrix.getRows(); row++) {

				if(matrix.getCell(row, col - 1) == matrix.getCell(row - 1, col)) {

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

	private float minValue(int row, int col) {

		int r, c;

		if(matrix.getCell(row - 1, col - 1) < matrix.getCell(row - 1, col) && matrix.getCell(row - 1, col - 1) < matrix.getCell(row, col)) {

			return (matrix.getCell(row - 1, col - 1) + 1);

		}
		else if(matrix.getCell(row - 1, col) < matrix.getCell(row - 1, col - 1) && matrix.getCell(row - 1, col) < matrix.getCell(row, col)) {

			return (matrix.getCell(row - 1, col) + 1);

		}
		else {

			return (matrix.getCell(row, col) + 1);

		}

	}

}
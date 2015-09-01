// setting up a Matrix
package ie.dit;

import java.util.*;

public class Matrix2D {

	private int[][] cell;

	private int rows;
	private int cols;

	
	public Matrix2D(int rows, int cols) {

		this.rows = rows;
		this.cols = cols;

		cell = new int[rows][cols];

	}

	public static Matrix2D add(Matrix2D a, Matrix2D b) {

		Matrix2D c = new Matrix2D(a.getRows(), a.getCols());

		if(a.rows != b.rows || a.cols != b.cols) {

			return c;

		}
		
		for (int row = 0 ; row < a.getRows() ; row ++) {

			for (int col = 0 ; col < a.getCols() ; col ++) {

				c.setCell(row, col, a.getCell(row, col) + b.getCell(row, col));
			
			}
		
		}
		
		return c;

	}

	public static Matrix2D mult(Matrix2D a, Matrix2D b) {

		Matrix2D c = new Matrix2D(a.rows, b.cols);

		int val;

		if(a.cols != b.rows) {

			System.out.println("These matrices are incompatible.");
			return c;

		}

		// Do the multiplication
		for(int i = 0; i < c.rows; i++) {

			for(int j = 0; j < c.cols; j++) {

				val = 0;

				for(int k = 0; k < a.cols; k++) {

					val += (a.getCell(i, k) * b.getCell(k, j));

				}

				c.setCell(i, j, val);
			}
		}

		return c;

	}


	public int getCell(int row, int col){ //throws Matrix2DException {

		// Add bounds check to avoid nullPointerException

		return cell[row][col];

	}

	public void setCell(int row, int col, int val) { //throws Matrix2DException {

		// store val at the position [row][col]
		cell[row][col] = val;

	}

	public int getRows() {

		return rows;
	}

	public int getCols() {

		return cols;
	}

	public void identity() {

		for(int row = 0; row < rows; row++) {

			for(int col = 0; col < cols; col++) {

				setCell(row, col, (row == col) ? 1 : 0);

			}
		}
	}

	public String toString() {

		String ret = "";

		for(int row = 0; row < rows; row++) {

			for(int col = 0; col < cols; col++) {

				ret += getCell(row, col) + " ";

			}
			ret += "\n";
		}

		return ret;

	}

	public void add(Matrix2D cell2) {

		if(rows != cell2.rows || cols != cell2.cols) {

			System.out.println("These matrices are incompatible.");
			return;

		}

		// Do the addition
		for(int i = 0; i < rows; i++) {

			for(int j = 0; j < cols; j++) {

				addCell(i, j, cell2.getCell(i, j));

			}

		}

	}

	public void addCell(int row, int col, int val) {

		cell[col][row] += val;

	}

	public void mult(Matrix2D b) {

		Matrix2D c = new Matrix2D(rows, b.cols);

		int val;

		if(cols != b.rows) {

			System.out.println("These matrices are incompatible.");
			return;

		}

		// Do the multiplication
		for(int i = 0; i < c.rows; i++) {

			for(int j = 0; j < c.cols; j++) {

				val = 0;

				for(int k = 0; k < cols; k++) {

					val += (getCell(i, k) * b.getCell(k, j));

				}

				c.setCell(i, j, val);
			}
		}

		rows = c.rows;
		cols = c.cols;
		cell = new int[rows][cols];

		for(int i = 0; i < rows; i++) {

			for(int j = 0; j < cols; j++) {

				setCell(i, j, c.getCell(i, j));

			}

		}

	}

	public void randomise(int max) {

		for(int row = 0; row < rows; row++) {

			for(int col = 0; col < cols; col++) {

				setCell(row, col, max * new Random().nextInt());
			}
		}

	}
}
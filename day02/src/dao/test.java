package dao;

import java.util.ArrayList;

public class test {
	public static void main(String[] args) {
		ArrayList<Integer> test = new ArrayList<>();
		test.add(123);
		test.add(123);
		test.add(123);
		test.add(123);
		for(int i=test.size(); i>0; i--){
			System.out.println(i);
		}
	}
}

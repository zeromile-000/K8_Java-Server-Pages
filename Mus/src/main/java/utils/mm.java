package utils;

import java.util.Scanner;

public class mm {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		System.out.print("출력할 단을 입력하세요 (2~9): ");
		int dan = scanner.nextInt();

		// 단 출력
		for (int i = 2; i < dan; i++) {
			for (int j = 1; j < 10; j++) {
				for (int k = 2; i < (9 / dan); i++) {
					System.out.println(i + "단");
					System.out.println(k + " * " + j + " = " + (k * j) + "/t");
				}
			}
			System.out.println(); // 각 단 사이에 빈 줄 추가
		}

		scanner.close();
	}
}

package Hasmot;

import java.util.Scanner;

public class Main {

 public static Scanner m = new Scanner(System.in);

 public static void main(String[] args) {

  while (m.hasNext()) {
   long a = m.nextLong();
   long b = m.nextLong();
   if (a > b) 
   {
       System.out.println(a - b);
   } 
   else {
          System.out.println(b - a);
       }
     }
   }
}

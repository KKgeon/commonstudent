package days09;

import java.util.Random;

/**
 * @author
 * @date 2024. 1. 11. - 오전 10:25:12
 * @subject  day08.Ex05_04.java 복사 + 붙이기
 * @content
 */
public class Ex02 {

   public static void main(String[] args) {
   
       // 로또 게임 횟수 입력 (n) : 3
      int n = 5;
             
      int [] lotto = new int[n*6]; // 18 
      for (int i = 0; i < n; i++) {
         fillLotto(lotto, i); // 한 게임을 채워넣는 함수 
         
      }
      dispLotto(lotto);
      
   } // main

   private static void dispLotto(int[] lotto) {
      for (int i = 0; i < lotto.length; i++) {
         System.out.printf("lotto[%d]=[%d] \t", i, lotto[i]);
         if (i%6==5) System.out.println();
      }
      System.out.println();       
   }

   private static void fillLotto(int[] lotto, int i) { // i = 0, 1, 2
      Random rnd = new Random(); 
       int lottoNumber = rnd.nextInt(45)+1;
       lotto[6*i] = lottoNumber;
       System.out.printf("[%d]",lottoNumber); 
       
       int index = 6*i+1;        
       while (index<=6*i+5) {           
          lottoNumber = rnd.nextInt(45)+1;
          System.out.printf("[%d]",lottoNumber); 
          
          // 11:02 수업 시작~
          if( !isDuplicateLotto(lotto,lottoNumber , index, i ) ) 
             lotto[index++] = lottoNumber;
          //index++;
      } // while
       System.out.println();
   }
 
   private static boolean isDuplicateLotto(int[] lotto, int lottoNumber, int index, int n) {
      for (int i = 6*n; i < index; i++) {
         if( lottoNumber == lotto[i]) {
            return true;                
         }
      }
      return false;
   }

} // class
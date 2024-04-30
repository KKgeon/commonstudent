package domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DeptEmpSalgradeVO {
   
   
   @Override 
   public String toString() {
      return String.format("%d %s %d %s %f", 
            deptno,dname,empno,ename,pay
            );
      
   }
   
   private int deptno;
   private int empno;
   private String dname;
   private String ename;
   private Date hiredate;
   private double pay;
   private int grade;
}
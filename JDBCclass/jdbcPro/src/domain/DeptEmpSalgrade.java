package domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import oracle.sql.DATE;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class DeptEmpSalgrade {
	
	private int empno;
	private String dname;
	private String ename;
	private Date hiredate;
	private double pay;
	private int grade;
	 
	 
	 
	 
	 
	/*
	 * 
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)    
	 */
}//c

-- SCOTT 

2. 함수종속성
3. 정규화

ㄱ. 정규화 ? 이상 현상이 발생하지 않도록 하려면, 관련 있는 속성들로만 릴레이션을 구성해야하는데 이를 위해 필요한 것이 정규화
ㄴ. 함수적 종속성 ? 

empno(PK) ename(Y)는 empno(X)에 종속되어있다

    X           Y   
  결정자       종속자
    X    →     Y



    (3) 이행 함수적 종속
        Y는 X에 함수적 종속이다
      결정자 종속자         결정자  종속자
        X -> Y              Y -> Z          일 때 X -> Z  함수적 종속이 되면 "이행 함수적 종속" 이라고 한다
        Z가 X에 이행적으로 함수 종속되었다고 한다.
        
        
        
3. 정규화 정의와 필요성
    (1) 제 1 정규형
    릴레이션에 속한 모든 속성의 도메인이 원자 값(atomic value)으로만 구성되어있으면 제 1 정규형에 속한다
    
    도메인 ? 속성 하나가 가질수 있는 모든 값의 집합을 해당 속성의 도메인이라고 한다
    예) 부서명 칼럼(속성) - 도메인 (영업부, 생산부, 총무부)
    
    
    (2) 제 2 정규형
    릴레이션이 제 1 정규형에 속하고, 기본키가 아닌 모든 속성이 기본키에 "완전 함수 종속" 되면 제 2 정규형에 속한다.
    "부분 함수 종속" 을  제거해서 "완전 함수 종속"으로 되면 우리는 제2정규형에 속한다라고 한다.
    복합키 -> 속성
    예) 고객ID + 이벤트 번호        ->      당첨여부
                고객 ID                    등급
                
    (3) 제 3 정규형 (3NF)
    릴레이션 제2정규형에 속하고, 기본키가 아닌 모든 속성이 기본키에 "이행적 함수 종속"이 되지 않으면 제3정규형에 속한다.
    
    
    (4) 보이스/코드 (BCNF)
    릴레이션의 함수 종속 관계에서 모든 결정자가 후보키이면 보이스/코드 정규형에 속한다.
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
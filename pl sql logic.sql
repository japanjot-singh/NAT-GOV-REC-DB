DECLARE 
V_STU_ID STUDENT_INFO.STU_ID%TYPE;
V_STU_NAME STUDENT_INFO.STU_NAME%TYPE;
V_AGE STUDENT_INFO.AGE%TYPE;
V_CONTACT STUDENT_INFO.CONTACT%TYPE;
V_CITY STUDENT_INFO.CITY%TYPE;
V_STATE STUDENT_INFO.STATE%TYPE;
V_REGION STUDENT_INFO.REGION%TYPE;
V_RS VARCHAR2(20):='CHENNAI';
V_RN VARCHAR2(20):='DELHI';
V_EID NUMBER:=501;
V_DEPT_ID DEPARTMENT.DEPT_ID%TYPE:=5;
V_EDATE STUDENT_INFO.EDATE%TYPE;
V_C VARCHAR2(20);

CURSOR C_ENROLL IS 
SELECT STU_ID, STU_NAME,CONTACT, REGION,EDATE
FROM STUDENT_INFO;
BEGIN 
	OPEN C_ENROLL;
LOOP
	FETCH C_ENROLL INTO V_STU_ID, V_STU_NAME,V_CONTACT,V_REGION,V_EDATE;
EXIT WHEN C_ENROLL%NOTFOUND;
IF V_REGION='north' THEN
V_C:=V_RN;
ELSIF V_REGION='south' THEN
V_C:=V_RS;
ELSE
DBMS_OUTPUT.PUT_LINE ('WRONG RECORDS');
END IF;
INSERT INTO ENROLLED(EID,STU_ID,DEPT_ID,CENTER,EXAM_DATE) VALUES (V_EID,V_STU_ID,V_DEPT_ID,V_C,DATE '2025-10-30'+15);
DBMS_OUTPUT.PUT_LINE(
                '==================== ADMIT CARD ====================' || CHR(10) ||
                'EID         : ' || V_EID || CHR(10) ||
                'Name        : ' || V_STU_NAME || CHR(10) ||
                'Contact     : ' || V_CONTACT || CHR(10) ||
                'Region      : ' || V_REGION || CHR(10) ||
                'Exam Center : ' || V_C || CHR(10) ||
                'Exam Date   : ' || (DATE '2025-10-30' + 15) || CHR(10) ||
                '===================================================='
            );
V_EID:=V_EID+1;
END LOOP;
CLOSE C_ENROLL;
COMMIT;
END;
/

 ---------------------------------------------------------------------------------------------------------------

DECLARE 
    V_EID          RESULTS.EID%TYPE;
    V_MARKS        RESULTS.MARKS%TYPE;
    V_EMP_ID       EMPLOYEES.EMP_ID%TYPE := 101; 
    V_DEPT_ID      EMPLOYEES.DEPT_ID%TYPE := 5; 
    V_SALARY       EMPLOYEES.SALARY%TYPE;
    V_JOINING_DATE EMPLOYEES.JOINING_DATE%TYPE;
    V_R            VARCHAR2(20);

    CURSOR C_EMP IS
        SELECT EID, MARKS 
        FROM RESULTS;
BEGIN
    OPEN C_EMP;
    LOOP
        FETCH C_EMP INTO V_EID, V_MARKS;
        EXIT WHEN C_EMP%NOTFOUND;

        IF V_MARKS >= 85 THEN
           
            V_R := 'PASSED';
            V_SALARY := 50000; 
            V_JOINING_DATE := DATE '2025-10-30' + 30;

           
            INSERT INTO EMPLOYEES (EMP_ID, EID, DEPT_ID, SALARY, JOINING_DATE)
            VALUES (V_EMP_ID, V_EID, V_DEPT_ID, V_SALARY, V_JOINING_DATE);

            DBMS_OUTPUT.PUT_LINE(
                '==================== REPORT CARD ====================' || CHR(10) ||
                'Exam ID     : ' || V_EID || CHR(10) ||
                'Marks       : ' || V_MARKS || CHR(10) ||
                'Result      : ' || V_R || CHR(10) ||
                '===================================================='
            );
            
            
            DBMS_OUTPUT.PUT_LINE(
                '==================== JOINING LETTER =================' || CHR(10) ||
                'Congratulations!' || CHR(10) ||
                'Ref: EID ' || V_EID || CHR(10) ||
                'We are pleased to offer you the position in Department ' || V_DEPT_ID || '.' || CHR(10) ||
                'Your Employee ID will be: ' || V_EMP_ID || CHR(10) ||
                'Your starting salary will be: ' || V_SALARY || CHR(10) ||
                'Your joining date is: ' || TO_CHAR(V_JOINING_DATE, 'DD-MON-YYYY') || CHR(10) ||
                '====================================================' || CHR(10)
            );
            
            
            V_EMP_ID := V_EMP_ID + 1;

        ELSE
           
            V_R := 'FAILED';
            
            
            DBMS_OUTPUT.PUT_LINE(
                '==================== REPORT CARD ====================' || CHR(10) ||
                'Exam ID     : ' || V_EID || CHR(10) ||
                'Marks       : ' || V_MARKS || CHR(10) ||
                'Result      : ' || V_R || CHR(10) ||
                'Status      : Better luck next time.' || CHR(10) ||
                '====================================================' || CHR(10)
            );
        END IF;
        
    END LOOP;
    CLOSE C_EMP;
    COMMIT;
END;
/


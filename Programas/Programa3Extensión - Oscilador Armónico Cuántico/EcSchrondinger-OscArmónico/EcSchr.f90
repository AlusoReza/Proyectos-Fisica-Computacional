      PROGRAM ECSCHR

      IMPLICIT NONE

      INTEGER*16:: S
      INTEGER*16:: NC, GAUOSIN, VIENTRES, N
      INTEGER*16:: I,J,K,M
      REAL*16:: PI
      REAL*16:: T,L, INCT, INCX, KO, OMEGA, ALPHAOSC
      REAL*16, DIMENSION(:), ALLOCATABLE:: NORMA, ZRARA
      REAL*16, DIMENSION(:,:), ALLOCATABLE:: HOSC
      COMPLEX*32:: CC
      COMPLEX*32, DIMENSION(:), ALLOCATABLE:: ALPHA, A, GAMMA, XM, PM
      COMPLEX*32, DIMENSION(:), ALLOCATABLE:: ETM, DELTAX, DELTAP, XM2, PM2
      COMPLEX*32, DIMENSION(:), ALLOCATABLE:: PCHEI
      COMPLEX*32, DIMENSION(:,:), ALLOCATABLE:: PHI, V, PHINORM, BETA, B
      COMPLEX*32, DIMENSION(:,:), ALLOCATABLE:: Q, PROB, DPHIDX, P, EC
      COMPLEX*32, DIMENSION(:,:), ALLOCATABLE:: EP, ET, DPHIDX2
      COMPLEX*32, DIMENSION(:,:,:), ALLOCATABLE:: PHIOSC
      

      PARAMETER(PI = 4.D0*ATAN(1.D0))
      PARAMETER(S = 1000)
      PARAMETER(L = 1.D0)
      PARAMETER(CC = (0.D0,1.D0))

!     PARA ENTENDER EN CONSIGUIENTE PROGRAMA HAY QUE TENER EN CUENTA QUE PARA REALIZAR LOS SIGUIENTES CÁLCULOS NUMÉRICOS SE HA APROXIMADO QUE h- ES APROXIAMDAMENTE 1 Y M=1/2.
      
!     ------------------------------------------------------
      
      WRITE(6,*) "-----------------------------------------------------"
      WRITE(6,*) " "
      WRITE(6,*) " "
      WRITE(6,*) " "
      WRITE(6,*) "SE MODELARA LA ECUACION DE SCHRODINGER DANDO UN "
      WRITE(6,*) "TIEMPO DURANTE EL CUAL SE VA A ESTAR MOVIENDO LA "
      WRITE(6,*) "ONDA EN UN ESPACIO FIJO L=1. EL PULSO (REFLEJADO"
      WRITE(6,*) "EN EL POTENCIAL Y ECUACIÓN DE ONFA), SERÁ, O "
      WRITE(6,*) "GAUSSIANO O UN PULSO SENOSIDUAL QUE GENERARÁ "
      WRITE(6,*) "UNA ONDA ESTACIONARIA. SE VA A CONSIDERAR UNA"
      WRITE(6,*) "PARTICULA LIBRE - V(X) = 0"
      WRITE(6,*) " "
      WRITE(6,*) " "
      WRITE(6,*) " "
      WRITE(6,*) "-----------------------------------------------------"

      CALL DATOS
      CALL RESULTADOS
      
      WRITE(6,*) "-----------------------------------------------------"
      WRITE(6,*) " "
      WRITE(6,*) " "
      WRITE(6,*) " "
      WRITE(6,*) "SE HAN OBTENIDO LOS CORRESPONDIENTES RESULTADOS, "
      WRITE(6,*) "PARA VISUALIZAR LOS DATOS IR A ARCHIVOS: PTRIES.dat"
      WRITE(6,*) "Y NXPHPH.dat QUE GUARDAN LOS DATOS CORRECTAMENTE"
      WRITE(6,*) "TABULADOS."
      WRITE(6,*) " "
      WRITE(6,*) " "
      WRITE(6,*) " "
      WRITE(6,*) "-----------------------------------------------------"
      
      STOP
!     ------------------------------------------------------
      CONTAINS
!     ------------------------------------------------------          
      INTEGER*16 FUNCTION FACT(X)
      
      IMPLICIT NONE
      INTEGER*16:: X, AUX
      IF ((X.EQ.0).OR.(X.EQ.1)) THEN
      
         FACT = 1
         
      ELSE 
      
      FACT = 1
      DO I = 1, X
         FACT = FACT*I	
      END DO
      
      END IF
      
      END FUNCTION FACT
!     ------------------------------------------------------      
      SUBROUTINE DATOS

      WRITE(6,*) "PRIMERO ES NECESARIO SABER DURANTE CUANTO"
      WRITE(6,*) "TIEMPO SE VA A VISUALIZAR LA ECUACIÓN, ASÍ"
      WRITE(6,*) "CÓMO LOS INTERVALOS DE TIEMPO EN LOS QUE"
      WRITE(6,*) "SE QUIERE QUE TRANSCURRA EL MISMO."
      WRITE(6,*) " "
      WRITE(6,*) " "
      
      WRITE(6,*) "INTRODUCA CUANTO TIEMPO (T) DESEA SE VISUALICE LA"
      WRITE(6,*) "ECUACIÓN DE SCHRODINGER EN SEGUNDOS:"
      WRITE(6,*) "- SE RECOMIENDA T DE APROXIMADAMENTE 5S."
      READ(5,*) T
      WRITE(6,*) " "

      T = 0.5D0

      WRITE(6,*) "INTRODUCA LOS PASOS TEMPORALES (INCT) EN LOS QUE "
      WRITE(6,*) "DESEA QUE PASE EL TIEMPO - T:"
      WRITE(6,*) "- SE RECOMIENDA INCT DE APROXIMADAMENTE 0.001S."
      READ(5,*) INCT
      WRITE(6,*) " "

      INCT = 0.0001D0
      
      INCX = L/S
      NC = T/INCT
      KO = 1.D0/(2.D0*(INCT**0.5D0))
      !OMEGA = INCT/(INCX**2)
      OMEGA = 200.D0
      
      ALLOCATE(PHI(0:S,0:NC))
      ALLOCATE(V(0:S,0:NC))
      ALLOCATE(NORMA(0:NC))
      ALLOCATE(PHINORM(0:S,0:NC))
      ALLOCATE(ALPHA(0:S-1))
      ALLOCATE(A(0:S))
      ALLOCATE(GAMMA(0:S-1))
      ALLOCATE(BETA(0:S-1,0:NC))
      ALLOCATE(B(0:S-1,0:NC))
      ALLOCATE(Q(0:S,0:NC))
      ALLOCATE(PROB(0:S,0:NC))
      ALLOCATE(XM(0:NC))
      ALLOCATE(PM(0:NC))
      ALLOCATE(DPHIDX(0:S,0:NC))
      ALLOCATE(P(0:S,0:NC))
      ALLOCATE(EC(0:S,0:NC))
      ALLOCATE(EP(0:S,0:NC))
      ALLOCATE(ET(0:S,0:NC))
      ALLOCATE(ETM(0:NC))   
      ALLOCATE(DPHIDX2(0:S,0:NC))
      ALLOCATE(DELTAX(0:NC))
      ALLOCATE(DELTAP(0:NC))
      ALLOCATE(XM2(0:NC))
      ALLOCATE(PM2(0:NC))
      ALLOCATE(PCHEI(0:NC))
      ALLOCATE(HOSC(0:200, 0:S))
      ALLOCATE(ZRARA(0:S))      
      ALLOCATE(PHIOSC(0:N,0:S,0:NC))

      WRITE(6,*) "SEGUNDO, ES NECESARIO SABER QUE TIPO DE PULSO"
      WRITE(6,*) "SE DESEA DAR. INTRODUZCA 1 SI DESEA QUE SEA"
      WRITE(6,*) "GAUSSIANO, SI DESEA QUE SEA SENOSIDUAL, PULSE 2."
      WRITE(6,*) "SI DESEA UN OSCILADOR ARMÓNICO, PULSE 3. Y SI DESEA"
      WRITE(6,*) "LA GAUSSIANA CON POTENCIAL TIPO PULSA 4."
1     READ(5,*) GAUOSIN

      GAUOSIN = 3

      IF (GAUOSIN.EQ.1) THEN

         CALL POTGAUSS

      ELSE IF (GAUOSIN.EQ.2) THEN

         CALL POTSIN

      ELSE IF (GAUOSIN.EQ.3) THEN

         CALL POTOSCARM

      ELSE IF (GAUOSIN.EQ.4) THEN

         CALL POTOSCGAU   
         
      ELSE   
      WRITE(6,*) "POR FAVOR, PULSE 1, 2, 3 O 4."
      GO TO 1   
      END IF

      CALL METNUM 
      CALL PROBABILIDAD
      CALL XPH
      CALL PHEISENBERG
      
      END SUBROUTINE DATOS
!     ------------------------------------------------------
      SUBROUTINE POTGAUSS
      
!     PRIMERO LAS CONDICIONES DE CONTORNO PARA LA ONDA:
      DO J = 0, NC
         PHI(0,J) = (0.D0,0.D0)
         PHI(S,J) = (0.D0,0.D0)
         PHINORM(0,J) = (0.D0,0.D0)
         PHINORM(S,J) = (0.D0,0.D0)
      END DO

!     DEFINIMOS EL POTENCIAL:
      DO I = 0, S
         DO J = 0, NC
            V(I,J) = 0.D0
         END DO   
      END DO

!     DEFINIMOS UNA ONDA GAUSSIANA:
      DO I = 1, S-1
         PHI(I,0)=EXP(2*PI*CC*KO*DBLE(I)*INCX)*EXP(-8.D0*((4.D0*DBLE(I)-DBLE(S))**2.D0)/(DBLE(S)**2.D0))
      END DO

      CALL NORM
      CALL AL

      END SUBROUTINE POTGAUSS
!     ------------------------------------------------------
      SUBROUTINE POTSIN
      
!     PRIMERO LAS CONDICIONES DE CONTORNO PARA LA ONDA:
      DO J = 0, NC
         PHI(0,J) = (0.D0,0.D0)
         PHI(S,J) = (0.D0,0.D0)
         PHINORM(0,J) = (0.D0,0.D0)
         PHINORM(S,J) = (0.D0,0.D0)
      END DO
      
!     DEFINIMOS EL POTENCIAL:
      DO I = 0, S
         DO J = 0, NC
            V(I,J) = 0.D0
         END DO   
      END DO

      WRITE(6,*) "INTRODUZCA EL NUMERO DE VIENTRES QUE DESEA "
      WRITE(6,*) "VER EN LA ONDA ESTACIONARIA."
      READ(5,*) VIENTRES

      VIENTRES = 4

!     DEFINIMOS UNA ONDA ESTACIONARIA:

      IF (MOD(VIENTRES,2).EQ.0) THEN
      DO I = 1, S-1
         PHI(I,0)= ((2/L)**0.5D0)*SIN((PI*VIENTRES/L)*DBLE(I)*INCX)
      END DO
      ELSE IF (MOD(VIENTRES,2).EQ.1) THEN
      DO I = 1, S-1
         PHI(I,0)= ((2/L)**0.5D0)*COS((PI*VIENTRES/L)*DBLE(I)*INCX)
      END DO
      END IF
      
      CALL NORM
      CALL AL

      END SUBROUTINE POTSIN
!     ------------------------------------------------------
      SUBROUTINE POTOSCARM
      REAL*16:: CONST
      
      ALPHAOSC = (OMEGA**0.5D0)/(2**0.5D0)
      
      DO I = 0, S
      ZRARA(I) = ALPHAOSC*(I*INCX-0.5D0)
      END DO
      
      DO I = 0, S
      HOSC(0,I) = 1.D0
      HOSC(1,I) = 2.D0*ZRARA(I)
      END DO
      
      DO K = 1, 199
      DO I = 0, S
      	HOSC(K+1,I) = 2.D0*(ZRARA(I)*HOSC(K,I) - K*HOSC(K-1,I))
      END DO
      END DO
               
      WRITE(6,*) 'INTRODUZCA PARA QUE NUMERO CUANTICO QUIERE QUE SEA'
      WRITE(6,*) 'LA FUNCIÓN DE ONDA DEL OSCILADOR ARMÓNICO (N).'
      READ(5,*) N
      
      N=15
            
!     DEFINIMOS FUNCIÓN DE ONDA:
      CONST = ((ALPHAOSC/((2**N)*(FACT(N))*((PI)**0.5D0)))**0.5D0)
      DO I = 1, S-1
         PHIOSC(N, I, 0)= CONST*EXP((-ALPHAOSC**2.D0/2.D0)*((I*INCX-0.5D0)**2.D0))*HOSC(N,I)
      END DO	
            
!     DEFINIMOS EL POTENCIAL:
      DO I = 0, S
         DO J = 0, NC
            V(I,J) = (OMEGA**2.D0/4.D0)*(I*INCX-0.5)**2.D0
         END DO   
      END DO        
      
      DO J = 0, NC
         PHIOSC(N,0,J) = (0.D0,0.D0)
         PHIOSC(N,S,J) = (0.D0,0.D0)
         PHINORM(0,J) = (0.D0,0.D0)
         PHINORM(S,J) = (0.D0,0.D0)
      END DO      
      
      CALL NORMOSC
      CALL AL
      END SUBROUTINE POTOSCARM
!     ------------------------------------------------------
      SUBROUTINE POTOSCGAU
      
!     PRIMERO LAS CONDICIONES DE CONTORNO PARA LA ONDA:
      DO J = 0, NC
         PHI(0,J) = (0.D0,0.D0)
         PHI(S,J) = (0.D0,0.D0)
         PHINORM(0,J) = (0.D0,0.D0)
         PHINORM(S,J) = (0.D0,0.D0)
      END DO

!     DEFINIMOS EL POTENCIAL:
      DO I = 0, S
         DO J = 0, NC
            V(I,J) = (OMEGA**2.D0/4.D0)*(I*INCX-0.5)**2.D0
         END DO   
      END DO

!     DEFINIMOS UNA ONDA GAUSSIANA:
      DO I = 1, S-1
         !PHI(I,0)=EXP(-((I*INCX-0.3)**2.D0)/(2.D0*((1.D0/16.D0)**2.D0)))
         !PHI(I,0)=EXP(-((I*INCX-0.5)**2.D0)/(2.D0*((1.D0/16.D0)**2.D0)))
         PHI(I,0)=EXP(-((I*INCX-0.5)**2.D0)/(2.D0*((1.D0/10.D0)**2.D0)))
      END DO

      CALL NORM
      CALL AL

      END SUBROUTINE POTOSCGAU
!     ------------------------------------------------------      
      SUBROUTINE NORM

      REAL*8:: NORMA1

      NORMA1=0.D0
      DO I=0, S
         NORMA1 = NORMA1 + ABS(PHI(I,0))**2.D0
      END DO
!     ESTAMOS REALIZANDO INTEGRALES DE RIEMANN. LA NORMA SE TRADUCE EN LA INTEGRAL DESDE 0 HASTA L DEL VALOR ABSOLUTO AL CUADRADO DE LA FUNCIÓN. PERO CÓMO EN FCOMPUTACION LA INTEGRAL CORRESPONDIENTE NO EXISTE TENEMOS QUE TRANSFORMARLA EN SUMATORIOS, DE IGUAL FORMA PERO MULTIPLICADO POR EL TAMAÑO DE LOS INTERVALOS EN LOS QUE INTEGRAMOS: INCX.      
      NORMA1 = NORMA1*INCX

!     PODEMOS NORMALIZAR LA FUNCIÓN DE ONDA HABIENDO YA OBTENIDO LA NORMA

      DO I=1, S-1
         PHINORM(I,0) = PHI(I,0)/(NORMA1**0.5D0)
      END DO

      NORMA(0)=0.D0
      DO I=0, S
         NORMA(0) = NORMA(0) + ABS(PHINORM(I,0))**2.D0
      END DO
      NORMA(0) = NORMA(0)*INCX
      
      
      END SUBROUTINE NORM
!     ------------------------------------------------------      
      SUBROUTINE NORMOSC

      REAL*8:: NORMA1

      NORMA1=0.D0
      DO I=0, S
         NORMA1 = NORMA1 + ABS(PHIOSC(N,I,0))**2.D0
      END DO
           
      NORMA1 = NORMA1*INCX

      DO I=1, S-1
         PHINORM(I,0) = PHIOSC(N,I,0)/(NORMA1**0.5D0)
      END DO

      NORMA(0)=0.D0
      DO I=0, S
         NORMA(0) = NORMA(0) + ABS(PHINORM(I,0))**2.D0
      END DO
      NORMA(0) = NORMA(0)*INCX
      
      
      END SUBROUTINE NORMOSC      
!     ------------------------------------------------------
      SUBROUTINE AL
!     AQUI VAMOS A GENERAR LOS VALORES DE ALPHA PARA PODER UTILIZARLOS POSTERIORMENTE.

      ALPHA(S-1) = (0.D0,0.D0)

      DO I = 0, S
         A(I) = -2.D0+(2.D0*CC/OMEGA)-(INCX**2)*V(I,0) 
      END DO   
      

      DO I = S-1, 0, -1
         GAMMA(I) = 1/(A(I)+ALPHA(I))
         ALPHA(I-1) = -GAMMA(I)
      END DO         
      
      END SUBROUTINE AL
!     ------------------------------------------------------      
      SUBROUTINE METNUM
!     CÓMENZAMOS CON EL METODO NUMERICO PARA VISUALIZAR LAS VARIACIONES CORRESPONDIENTES EN LA LONGITUD L DE LA ECUACION DE SCHRODINGER PARA EL DETERMINADO TIEMPO DADO
	WRITE(6,*) 4	
      
      DO J = 0, NC-1
         
         BETA(S-1,J) = (0.D0,0.D0)
         
         DO I = 0, S
            B(I,J)=4.D0*CC*PHINORM(I,J)/OMEGA
         END DO
         
         DO I = S-1, 0, -1
            BETA(I-1,J) = GAMMA(I)*(B(I,J)-BETA(I,J))
         END DO

         Q(0,J) = (0.D0,0.D0)
         Q(S,J) = (0.D0,0.D0)

         DO I=0, S-2
            Q(I+1,J) = ALPHA(I)*Q(I,J) + BETA(I,J)
         END DO

         NORMA(J+1) = 0.D0
         DO I=1, S-1
            PHINORM(I,J+1) = Q(I,J) - PHINORM(I,J)
            NORMA(J+1) = NORMA(J+1) + ABS(PHINORM(I,J))**2.D0
         END DO   
         NORMA(J+1) = NORMA(J+1)*INCX
         
      END DO   

      END SUBROUTINE METNUM
!     ------------------------------------------------------     
      SUBROUTINE PROBABILIDAD
      DO I = 0, S
         DO J = 0, NC
            PROB(I,J)=ABS(PHINORM(I,J))**2.D0
         END DO
      END DO      
      END SUBROUTINE PROBABILIDAD
!     ------------------------------------------------------
!     PROCEDEMOS A CALCULAR LA POSICION MEDIA, MOMENTO MEDIO Y ENERGÍA MEDIA PARA LO ANTERIOR.
      SUBROUTINE XPH
     
!     EL VALOR MEDIO DE LA POSICIÓN PARA CADA INSTANTE DE TIEMPO ES LA SUMA DE LA POSICIÓN DE LA ONDA POR LA PROBABILIDAD DE ENCONTRAR ESTA MISMA EN LA DICHA POSICIÓN.
      DO J = 0, NC
         XM(J) = 0.D0
         XM2(J) = 0.D0
         DO I = 0, S
            XM(J) = XM(J) + (I*INCX)*PROB(I,J)
            XM2(J) = XM2(J) + ((I*INCX)**2.D0)*PROB(I,J)        
         END DO   
         XM(J) = XM(J)*INCX
         XM2(J) = XM2(J)*INCX
      END DO
      
      DO J = 0, NC
         PM(J) = (0.D0,0.D0)
         DPHIDX(0,J) = (0.D0,0.D0)
         DPHIDX(S,J) = (0.D0,0.D0)
         DO I = 1, S-1
         DPHIDX(I,J) = (PHINORM(I+1,J)-PHINORM(I-1,J))/(2*INCX)
         END DO
         DO I = 0, S
            P(I,J) = DPHIDX(I,J)*(-CC)
            PM(J) = PM(J) + CONJG(PHINORM(I,J))*P(I,J)            
         END DO   
         PM(J) = INCX*PM(J)
      END DO

!     AHORA, LA ENERGÍA TOTAL DEL SISTEMA E O H, AMBAS SON LO MISMO. SE OBTIENE COMO LA SUMA DE LA ENERGÍA CINÉTICA Y POTENCIAL. SE VA A SEGUIR EL MISMO PROCEDIMIENTO QUE PARA EL MOMENTO. TENEMOS QUE TENER EN CUENTA QUE EN ESTE CASO HEMOS LLAMADO A LA VARIABLE (P**2/2M)*FUNCION DE LA ENERGÍA TOTAL COMO EC, ES DECIR, REALMENTE EC = (P**2/2M)*FUNCION, Y COMO M*1/2, ENTONCES EC = P**2*FUNCION, ES EL OPERADOR MOMENTO AL CUADRADO SOBRE LA FUNCIÓN, Y LO PODEMOS USAR PARA CALCULAR <P**2>
     
      DO J = 0, NC
         ETM(J) = (0.D0,0.D0)
         PM2(J) = (0.D0,0.D0)
         DPHIDX2(0,J) = (0.D0,0.D0)
         DPHIDX2(S,J) = (0.D0,0.D0)
         DO I = 1, S-1
            DPHIDX2(I,J) = (DPHIDX(I+1,J)-DPHIDX(I-1,J))/(2*INCX)
         END DO 
         DO I = 0, S
            EC(I,J) = -DPHIDX2(I,J)
            PM2(J) = PM2(J) + CONJG(PHINORM(I,J))*EC(I,J)
            EP(I,J) = V(I,J)*PHINORM(I,J)
            ET(I,J) = EC(I,J) + EP(I,J)
            ETM(J) = ETM(J) + CONJG(PHINORM(I,J))*ET(I,J)   
         END DO   
         ETM(J) = INCX*ETM(J)
         PM2(J) = INCX*PM2(J)
      END DO
      
      ! CREO QUE PARA EL CASO DE XM Y XM2 ESTAMOS HACIENDO UNAS PARTICIONES DE L Y HACEMOS LA INTEGRAL COMO LA SUMA (DE RIEMANN) DE UNA FUNCIÓN DEPENDIENTE DE LAS MISMAS POR SU TAMAÑO HORIZONTAL. AHORA BIEN, PARA EL CASO DE PM Y ETM LA REALIDAD ES Q LA FUNCIÓN NO DEPENDE DE LAS PARTICIONES DE LAS PARTICIONES REALMENTE, PUES CÓMO VEMOS EN LA PARTE SUPERIOR POR EJEMPLO PARA EL CASO DE UNA ONDA ESTACIONARIA SENOIDAL ESTAMOS COGIENDO LAS PARTICIONES I Y MULTIPLICANDOLAS POR SU CORRESPONDIENTE TAMAÑO. POR LO TANTO EL VALOR DE LA FUNCION DE ONDA NO ES DEPENDIENTE DE LA PARTICIÓN DE L, SINO DE LOS PUNTOS DE L. IGUAL PARA ETM. POR ESO SI HACEMOS LA INTEGRAL CÓMO UNA SUMA DE RIEMANN NO SALE LOS RESULTADOS ESPERADOS. POR OTRO LADO IMPORTANTE RESALTAR QUE ESTAMOS REALIZANDO LAS DERIVADAS COMO INCPHI/INCX, Y LA DISTANCIA ENTRE UN PUNTO I+1 Y OTRO I-1 ES 2*INCX QUE ES 2 VECES LA ANCHURA DE LA PARTICIÓN.
      
      END SUBROUTINE XPH 
!     ------------------------------------------------------
      SUBROUTINE PHEISENBERG

      DO J = 0, NC
         DELTAX(J) = (XM2(J)-XM(J)**2.D0)**0.5D0
         DELTAP(J) = (PM2(J)-PM(J)**2.D0)**0.5D0
         PCHEI(J) = DELTAX(J)*DELTAP(J)
      END DO   
      

      END SUBROUTINE PHEISENBERG
!     ------------------------------------------------------      
      SUBROUTINE RESULTADOS

      OPEN(UNIT=10, FILE = 'PTRIES.dat', STATUS='UNKNOWN')
      WRITE(10,*)'#N-TIE, J-POS, RE(PHI(I,J)), IM(PHI(I,J)), PROB(I,J).'
      DO J = 0, NC
         DO I = 0, S
            WRITE(10,*) J,I,REAL(PHINORM(I,J)),AIMAG(PHINORM(I,J)), REAL(PROB(I,J))
         END DO
         WRITE(10,*)
         WRITE(10,*)
      END DO   
      CLOSE(10)

      OPEN(UNIT=11, FILE = 'NXPHPHFT.dat', STATUS='UNKNOWN')
      WRITE(11,*) '#N-TIE, NORM, XM-POSMED, PM-MOMMED, HM-ETMED, DX*DP.'
      DO J = 0, NC
         WRITE(11,*) J, NORMA(J), REAL(XM(J)), REAL(PM(J)), REAL(ETM(J)), REAL(PCHEI(J))
      END DO   
      CLOSE(11)
      
      END SUBROUTINE RESULTADOS
!     ------------------------------------------------------      
      END PROGRAM ECSCHR

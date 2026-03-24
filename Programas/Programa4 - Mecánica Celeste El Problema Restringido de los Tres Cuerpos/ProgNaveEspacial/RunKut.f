      PROGRAM NAVESPRUNGKUT

      IMPLICIT NONE
  
      INTEGER*8:: I, J, L, M, N
      INTEGER*8:: PT, PHANA
      REAL*8:: PI, G, RT, RL, MT, ML, OMEGA, DTL
      REAL*8:: T, INCT, THETA, V, INC, NU, RP
      REAL*8, DIMENSION(:), ALLOCATABLE:: H, XN, YN, XL, YL
      REAL*8, DIMENSION(:,:), ALLOCATABLE:: Y
      REAL*8, DIMENSION(:,:,:), ALLOCATABLE:: K
      
!     EN MEDIDAS DEL SISTEMA INTERNACIONAL. PUNTUALIZAR QUE LOS RESPECTIVOS VALORES A LA TIERRA Y LA LUNA, SON T Y L, PARA EL RADIO R Y LA MASA M. OMEGATL ES LA VELOCIDAD ANGULAR DE LA LUNA (2*PI/T) EN 1/S.
      
      PARAMETER(PI = 4.D0*ATAN(1.D0))
      PARAMETER(G = 6.67D-11)
      PARAMETER(RT = 6.378160D6)
      PARAMETER(RL = 1.7374D6)
      PARAMETER(MT = 5.9736D24)
      PARAMETER(ML = 0.07349D24)
      PARAMETER(OMEGA = 2.6617D-6)
      PARAMETER(DTL = 3.844D8)
      PARAMETER(DELTA = G*MT/(DTL**3))
      PARAMETER(NU = ML/MT)

!     ------------------------------------------------------
      
      WRITE(6,*) "-----------------------------------------------------"
      WRITE(6,*) " "
      WRITE(6,*) " "
      WRITE(6,*) " "
      WRITE(6,*) "SE MODELARA EL RECORRIDO QUE DEBE HACER UN COHETE "
      WRITE(6,*) "LANZADO DESDE LA TIERRA Y QUE LLEGA HASTA LA LUNA "
      WRITE(6,*) "SIGUIENDO LA TRAYECTORIA QUE MÁS ACERTADA DEBERÍA"
      WRITE(6,*) "DE LLEGAR PARA QUE EL VIAJE SEA POSIBLE. "
      WRITE(6,*) "PARA ELLO, SE USARÁ UN ALGORITMO DE RUNGE-KUTTA "
      WRITE(6,*) "QUE COMPUTA MUY APROXIMADAMENTE LAS DERIVADAS DE "
      WRITE(6,*) "LA FUNCION QUE DESCRIBE DICHO MOVIMIENTO."
      WRITE(6,*) " "
      WRITE(6,*) " "
      WRITE(6,*) " "
      WRITE(6,*) "-----------------------------------------------------"
  
      CALL DATOS
!     ------------------------------------------------------
      CALL METRUNKUT
!     ------------------------------------------------------      
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
      REAL*8 FUNCTION F1(X)
      REAL*8 X

      F1 = X

      END FUNCTION

      REAL*8 FUNCTION F2(X,Y)
      REAL*8 X, Y

      F2 = X/Y**2.D0

      END FUNCTION

      REAL*8 FUNCTION F3(X,Y,Z,T)
      REAL*8 X, Y, Z, T
      REAL*8 AUX1, AUX2

      AUX1 = (1.D0 + Y**2.D0 - 2.D0*Y*COS(Z-OMEGA*T))**(0.5D0)
      AUX2 = (Y-COS(Z-OMEGA*T))/(AUX1**3.D0)
      F3 = (X**2.D0)/(Y**3.D0)-INC*(1.D0/(Y**2.D0) + NU*AUX2)

      END FUNCTION
      
      REAL*8 FUNCTION F4(X,Y,T)
      REAL*8 X, Y, T
      REAL*8 AUX

      AUX = (1 + X**2 - 2*X*COS(Y-OMEGA*T))**(0.5D0)
      F4 = -INC*NU*(X/(AUX**3.D0))*SIN(Y-OMEGA*T)

      END FUNCTION

!     ------------------------------------------------------ 
      SUBROUTINE DATOS

      WRITE(6,*) 'INTRODUZCA EL TIEMPO (T) QUE DESEA QUE TRANSCURRA'
      WRITE(6,*) 'EN DIAS.'
      READ(5,*) T

      T = T*24*3600

      WRITE(6,*) ' '
      WRITE(6,*) 'INTRODUZCA AHORA EL TAMAÑO DE LOS SALTOS TEMPORALES'
      WRITE(6,*) '(INCT) PARA LOS QUE DESEAS QUE TRANSCURRA T, EN SEG.'
      WRITE(6,*) '(SE RECOMIENDA QUE SEA DE APROXIMADAMENTE 1MIN-60S)'
      READ(5,*) INCT

      PT=T/INCT

!     Y(VARIABLES DE 1 A 4 R-PHI..., TIEMPO), K(VARIABLES, 4ºORDEN, TIEMPO).

      ALLOCATE(H(0:PT))
      ALLOCATE(XN(0:PT))
      ALLOCATE(YN(0:PT))
      ALLOCATE(XL(0:PT))
      ALLOCATE(YL(0:PT))
      ALLOCATE(Y(1:4,0:PT))
      ALLOCATE(K(1:4,1:4,0:PT))

      WRITE(6,*) ' '
      WRITE(6,*) 'EL VALOR DE INCT ES UN VALOR QUE DARÁ UN ERROR EN'
      WRITE(6,*) 'LAS MEDIDAS QUE SERÁ MENOR CUANTO MENOR SEA INCT.'
      WRITE(6,*) 'PERO CUANTO MÁS PEQUEÑO ES MÁS TARDARÁ EL PC EN'
      WRITE(6,*) 'REALIZAR LOS CORRESPONDIENTES CÁLCULOS. POR SUERTE,'
      WRITE(6,*) 'EXISTE UN MÉTODO PARA QUE PARA CUALQUIER INC, ESTE'
      WRITE(6,*) 'SE ADAPTE A LO LARGO DEL PROCEDIMIENTO Y REDUZCA EL'
      WRITE(6,*) 'ERROR.'
      WRITE(6,*) ''
      WRITE(6,*) 'SI DESEA APLICARLO, PULSE 1. EN CASO CONTRARIO PULSE 2.'

2     READ(5,*) PHANA

      IF ((PHANA.EQ.1).OR.(PHANA.EQ.2)) THEN
      ELSE
         WRITE(6,*) 'POR FAVOR, INTRODUZCA 1 O 2.'
         GO TO 2
      END IF   
         
!     LAS VARIABLES A TRABAJAR SON CUATRO, R, PHI, PR Y PPHI. ADEMÁS LAS VAMOS A UTILIZAR REESCALADAS. LOS DOS PRIMEROS INDICAN EL PUNTO DE LANZAMIENTO DEL COHETE INICIALMENTE. ESTÁN EN COORDENADAS CILINDRICAS. Y LAS OTRAS DOS NO TIENEN MUCHO SIGNFICADO INTUITIVO, SON DERIVATIVOS DE LA VELOCIDAD DE CADA VARIABLE. LOS MOMENTOS. POR LO QUE EXISTE UNA CLARA RELACIÓN ENTRE UN PAR DE LAS VARIABLES Y LAS OTRAS.

!     PRIMERO R. 
      Y(1,0) = RT/DTL

!     SEGUNDO PHI. (ES NECESARIO INTRODUCIRLO POR PANTALLA.)
      WRITE(6,*) ' '
      WRITE(6,*) 'CONSIDERE UN CORTE TRANSVERSAL DE LA TIERRA. Y LA'
      WRITE(6,*) 'LATITUD CÓMO UNA COORDENADA DE UN SISTEMA DE'
      WRITE(6,*) 'COORDENADAS CILINDRICO. POSITIVO HACIA EL NORTE'
      WRITE(6,*) 'NEGATIVO HACIA EL SUR'
      WRITE(6,*) ' '
      WRITE(6,*) 'INTRODUCA DESDE QUE LATITUD - PHI (EN GRADOS) DESEA'
      WRITE(6,*) 'ENVIAR EL COHETE.'
      READ(6,*) Y(2,0)

      Y(2,0) = Y(2,0)*(PI/180)
      
!     TERCERO PR. (PARA CALCULARLO NECESITAMOS V Y THETA - VELOCIDAD INICIAL Y ANGULO DE LA MISMA CON RESPECTO AL PLANO TANGENCIAL CON RESPECTO A LA ESFERA TERRESTRE A UNA LATITUD DETERMINADA.)
      WRITE(6,*) ' '
      WRITE(6,*) 'CON VELOCIDAD INCIAL (V) DESEA ENVIAR EL COHETE'
      WRITE(6,*) 'EN KM/H.'
      WRITE(6,*) '(TEN EN CUENTA QUE LA VELOCIDAD DE ESCAPE DE UN'
      WRITE(6,*) 'OBJETO CONSIDERANDO LA TIERRA ES DE 40320 KM/H'
      READ(5,*)

      V = V*(1000/3600)
      V = V/DTL

      WRITE(6,*) ' '
      WRITE(6,*) 'AHORA INTRODUZCA EL ÁNGULO CON RESPECTO AL PLANO'
      WRITE(6,*) 'PLANO TANGENCIAL CON RESPECTO A LA ESFERA TERRESTRE,'
      WRITE(6,*) 'THETA, CON EL QUE DESEA QUE SALGA EL COHETE.'
      WRITE(6,*) 'EN GRADOS'
      WRITE(6,*) '(SU VALOR DEBE ESTAR ENTRE 0 Y 180 GRADOS, MAS O'
      WRITE(6,*) 'SERÍA CÓMO ENVIAR EL COHETE DENTRO DE LA TIERRA.)'
1     READ(5,*) THETA

      IF ((THETA.GE.0.D0).AND.(THETA.LE.180)) THEN

      ELSE
         WRITE(6,*) 'HAZ INTRODUCIDO UN VALOR ERRONEO DE THETA.'
         WRITE(6,*) 'POR FAVOR, VUELVA A INTRODUCIRLO.'
         GO TO 1
      END IF   
      
      THETA = THETA * (PI/180)

      Y(3,0) = V*COS(THETA-Y(2,0))
      
!     CUARTO PTHETA.

      Y(4,0) = Y(1,0)*V*SIN(THETA-Y(2,0))
      
!     DEFINIMOS TAMBIÉN LAS POSICIONES DE LA NAVE Y LA LUNA EN UN SISTEMA DE COORDENADAS CARTESIANOS PARA EL MOMENTO INICIAL. TENER EN CUENTA QUE T INICIAL ES 0. Y QUE DEBEMOS QUITAR EL REESCALADO.
      
      XN(0) = (Y(1,0)*DTL)*COS(Y(2,0)) 
      YN(0) = (Y(1,0)*DTL)*SIN(Y(2,0))

      XL(0) = DTL*COS(0.D0)
      YL(0) = DTL*SIN(0.D0)

      END SUBROUTINE DATOS
!     ------------------------------------------------------
      SUBROUTINE METRUNKUT
      REAL*8:: AUXK
      REAL*8, DIMENSION(1:4):: AUXF

!     LA VARIABLE K ES FUNCIÓN DE LAS ECUACIONES DE MOVIMIENTO. ESTAS SON LAS DERIVADAS TEMPORALES DE LAS VARIABLES R, PHI, PT Y PPHI CÓMO FUNCIÓN UNAS DE LAS OTRAS.
      DO J = 0, PT-1
         
         IF (PHANA.EQ.1) THEN
            CALL VALORH
         ELSE
            H(J) = INCT
         END IF
      
      DO I = 1, 4

         IF (I.EQ.1) THEN
            AUXF(1) = F1(Y(3,J))
            AUXF(2) = F2(Y(4,J),Y(1,J))
            AUXF(3) = F3(Y(4,J),Y(1,J),Y(2,J),J*H(J))
            AUXF(4) = F4(Y(1,J),Y(2,J),J*H(J))
         ELSE IF (I.EQ.2) THEN
            AUXF(1) = F1(Y(3,J)+K(3,1,J)/2.D0)
            AUXF(2) = F2(Y(4,J)+K(4,1,J)/2.D0,Y(1,J)+K(1,1,J)/2.D0)
            AUXF(3) = F3(Y(4,J)+K(4,1,J)/2.D0,Y(1,J)+K(1,1,J)/2.D0,Y(2,J)+K(2,1,J)/2.D0,J*H(J) + H(J)/2.D0)
            AUXF(4) = F4(Y(1,J)+K(1,1,J)/2.D0,Y(2,J)+K(2,1,J)/2.D0,J*H(J) + H(J)/2.D0)
         ELSE IF (I.EQ.3) THEN
            AUXF(1) = F1(Y(3,J)+K(3,2,J)/2.D0)
            AUXF(2) = F2(Y(4,J)+K(4,2,J)/2.D0,Y(1,J)+K(1,2,J)/2.D0)
            AUXF(3) = F3(Y(4,J)+K(4,2,J)/2.D0,Y(1,J)+K(1,2,J)/2.D0,Y(2,J)+K(2,2,J)/2.D0,J*H(J) + H(J)/2.D0)
            AUXF(4) = F4(Y(1,J)+K(1,2,J)/2.D0,Y(2,J)+K(2,2,J)/2.D0,J*H(J)*J + H(J)/2.D0)
         ELSE
            AUXF(1) = F1(Y(3,J)+K(3,3,J))
            AUXF(2) = F2(Y(4,J)+K(4,3,J),Y(1,J)+K(1,3,J))
            AUXF(3) = F3(Y(4,J)+K(4,3,J),Y(1,J)+K(1,3,J),Y(2,J)+K(2,3,J),J*H(J) + H(J))
            AUXF(4) = F4(Y(1,J)+K(1,3,J),Y(2,J)+K(2,3,J),J*H(J) + H(J))
         END IF
         
         DO M =1, 4   
            K(M,I,J) = AUXF(M)
         END DO
      
      END DO   

      DO I = 1, 4
         AUXK = K(I,1,J) + 2.D0*K(I,2,J) + 2.D0*K(I,3,J) + K(I,4,J)
         Y(I,J+1) = Y(I,J) + (1.D0/6.D0)*H(J)*AUXK
      END DO

      XN(J+1) = (Y(1,J+1)*DTL)*COS(Y(2,J+1)) 
      YN(J+1) = (Y(1,J+1)*DTL)*SIN(Y(2,J+1))

      XL(J+1) = DTL*COS(OMEGA*J*H(J))
      YL(J+1) = DTL*SIN(OMEGA*J*H(J))
      
      END DO   

      END SUBROUTINE METRUNKUT
!     ------------------------------------------------------
      SUBROUTINE VALORH

      END SUBROUTINE VALORH
!     ------------------------------------------------------      
      SUBROUTINE RESULTADOS

      OPEN(UNIT=10, FILE='', STATUS='UNKNOWN')
      WRITE(10,*) '#T, XNAVE, YNAVE, XLUNA, YLUNA.'
      DO I = 1, PT
         WRITE(10,*) I*H(I), XN(I), YN(I), XL(I), YL(I)
      END DO   
      CLOSE(10)

      END SUBROUTINE RESULTADOS
!     ------------------------------------------------------ 
      END PROGRAM NAVESPRUNGKUT

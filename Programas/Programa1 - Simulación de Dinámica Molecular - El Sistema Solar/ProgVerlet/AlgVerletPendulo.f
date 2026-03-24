!     ESTE PROGRAMA RESUELVE LA ECUACIÓN DE UN PENDULO SIMPLE SIGUIENDO UN
!     ALGORITMO DE VERLET Y PARA UN NUMERO DE PARTÍCULAS. 

      PROGRAM PENDSIMPALGVERLET

      IMPLICIT NONE
      INTEGER*8:: NP, TT, DIV
      REAL*8:: H, T, PI, G
      REAL*8, DIMENSION(:), ALLOCATABLE:: DT, R, M
      REAL*8, DIMENSION(:,:), ALLOCATABLE:: THETA1, THETA2, THETA3
      REAL*8, DIMENSION(:,:), ALLOCATABLE:: X, Y, EC, EP, ET

      PARAMETER(PI = 4.D0*ATAN(1.D0))
      PARAMETER(G = 9.80665)

      WRITE(6,*) "ESTE PROGRAMA RESUELVE LA ECUACION DE UN "
      WRITE(6,*) "PÉNDULO SIMPLE SIGUIENDO UN ALGORITMO DE VERLET."
      WRITE(6,*) " "
      WRITE(6,*) " "

!     INICIAMOS PROGRAMA PIDIENDO QUE SE INTRODUZCAN LOS DATOS DESEADOS
      CALL DATOS

!     PEDIMOS QUE HAGA EL ALGORITMO DE VERLET.
      CALL ALGVERLET
      CALL CALEYPOS
      
      STOP

      CONTAINS

      SUBROUTINE DATOS

      INTEGER*8:: I, J

!      WRITE(6,*) "- INTRODUZCA EL NUMERO DE PARTICULAS:"
!      READ(5,*) NP
!      WRITE(6,*) "- INTRODUZCA EL TIEMPO (T) INICIAL EN SEGUNDOS (S):"
!      READ(5,*) T
!      WRITE(6,*) "- INTRODUZCA EL TIEMPO TRANSCURRIDO (T) EN S:"
!      WRITE(6,*) " (PARA VER MEJOR LA VARIACION DE LAS VARIABLES,"
!      WRITE(6,*) " SE DEBE INTRODUCIR UN ORDEN DE MAGNITUD DE "
!      WRITE(6,*) " APROXIMADAMENTE 100.)"
!      READ(5,*) TT
!      WRITE(6,*) "- INTRODUZCA EL TIEMPO TRANSCURRIDO DIF. (H) EN S:"
!      WRITE(6,*) "(TEN EN CUENTA QUE PARA QUE SALGAN DATOS DENOTABLES"
!      WRITE(6,*) "H DEBERIA DE ESTAR EN EL RANGO DE 0.01.)"
!      READ(5,*) H
       
       NP = 1
       T = 0.D0
       TT = 100.D0
       H = 0.01D0
      
      ALLOCATE(R(1:NP))
      ALLOCATE(M(1:NP))

!      WRITE(6,*) "POR OTRO LADO, INTRODUZCA LA DISTANCIA (M) DESDE"
!      WRITE(6,*) "EL ORIGEN DE COORDENADAS A LA MASA DEL PENDULO."
!      DO I=1, NP
!         READ(5,*) R(I)
!      END DO
	
      R(1)=1.D0
		
!      WRITE(6,*) "FINALMENTE, INTRODUZCA LA MASA (KG) DEL OBJETO PARA"
!      WRITE(6,*) "CADA UNO DE LOS PENDULOS."
!      DO I=1, NP
!         READ(5,*) M(I)
!      END DO
      
      M(1) = 1.D0
      
      DIV = (TT-T)/H
      
      ALLOCATE(DT(1:DIV))
      ALLOCATE(THETA1(1:NP,1:DIV))
      ALLOCATE(THETA2(1:NP,1:DIV))
      ALLOCATE(THETA3(1:NP,1:DIV))
      ALLOCATE(X(1:NP,1:DIV))
      ALLOCATE(Y(1:NP,1:DIV))
      ALLOCATE(EC(1:NP,1:DIV))
      ALLOCATE(EP(1:NP,1:DIV))
      ALLOCATE(ET(1:NP,1:DIV))

     
      DT(1) = T
      DO I=2, DIV
         DT(I)= DT(I-1) + H
      END DO   

      
      
      DO I=1, NP
         
         WRITE(6,*) "- INTRODUZCA LA POSICIÓN (THETA1),",I, "INICIAL:"
         WRITE(6,*) "(EN ÁNGULO º)"
         READ(5,*) THETA1(I,1)
         
         THETA1(I,1) = THETA1(I,1) * (PI/180.D0)

         WRITE(6,*) "INTRODUZCA LA VELOCIDAD (THETA2),",I, "INICIAL:"
         WRITE(6,*) "(EN RAD/S)"
         READ(5,*) THETA2(I,1)
      
      END DO
      
      WRITE(6,*) "LOS DATOS INTRODUCIDOS SON:"
      WRITE(6,*) "NP=",NP,"T=",T,"H=",H
      DO I=1, NP
      WRITE(6,*) "- PARA LA PARTICULA:",I 
      WRITE(6,*) "THETA1=",THETA1(I, 1),"Y THETA2= ",THETA2(I,1)
      END DO
      END SUBROUTINE DATOS


      SUBROUTINE ALGVERLET

      INTEGER*8:: I, J 
      REAL*8, DIMENSION(:,:), ALLOCATABLE:: ALPHA

      ALLOCATE(ALPHA(1:NP,1:DIV))

      DO I = 1, NP
         THETA3(I,1) = -G*SIN(THETA1(I,1))/R(I)
      END DO   
      
      DO I=1, NP
         DO J=1, DIV-1
            
         ALPHA(I,J) = THETA2(I,J) + (H/2.D0)*THETA3(I, J)
         THETA1(I,J+1) = THETA1(I,J) + ALPHA(I,J)*H
         THETA3(I,J+1) = -G*SIN(THETA1(I,J+1))/R(I)
         THETA2(I,J+1) = ALPHA(I, J) + (H/2.D0)*THETA3(I,J+1)

             
         END DO
      END DO

      !EL ÁNGULO SALDRÁ EN RADIANES.

!      DO I = 1, DIV
!        WRITE(6,*) THETA1(1,I)
!      END DO   

      OPEN(UNIT = 20, FILE = 'VARTHETAPART1.dat', STATUS = 'UNKNOWN')
      WRITE(20,*) "# T, THETA."
      DO J=1, DIV
         
         WRITE(20,*) DT(J), THETA1(1,J)
      END DO
      CLOSE(20)

      OPEN(UNIT = 21, FILE = 'DIAGASES.dat', STATUS = 'UNKNOWN')
      WRITE(21,*) "# THETA1, THETA2."
      DO J=1, DIV
         
         WRITE(21,*) THETA1(1,J), THETA2(1,J)
      END DO
      CLOSE(21)
      
      END SUBROUTINE ALGVERLET

      SUBROUTINE CALEYPOS

      INTEGER*8:: I, J

!     SI CONSIDERAMOS UN PENDULO SIMPLE ESTE OSCILARA DE MANERA CIRCULAR A UNA DISTANCIA R DESDE EL ORIGEN DE CORDENADAS Y LAS POSICIONES X E Y SE CALCULARAN COMO: X = R*SEN(THETA) Y X = R*COS(THETA)
      DO I=1, NP
         DO J = 1, DIV
            
            X(I,J) = R(I)*SIN(THETA1(I,J))
            Y(I,J) = -R(I)*COS(THETA1(I,J))
            EC(I,J) = 0.5D0*M(I)*((THETA2(I,J)*R(I))**2.D0)
            EP(I,J) = M(I)*G*(Y(I,J))
            ET(I,J) = EC(I,J) + EP(I,J)
            
         END DO
      END DO

      OPEN(UNIT = 22, FILE = 'POSXYPEND.dat', STATUS = 'UNKNOWN')
      WRITE(22,*) "# X, Y."
      DO J=1, DIV         
         WRITE(22,*) X(1,J), Y(1,J)
      END DO
      CLOSE(22)

      OPEN(UNIT = 23, FILE = 'ENERGYTIEM.dat', STATUS = 'UNKNOWN')
      WRITE(23,*) "# T,  EC, E, ET."
      DO J=1, DIV
!         WRITE(22,*) "# T, EC, EP, ET."
!     WRITE(22,*) DT(J), EC(1,J), EP(1,J), ET(1,J)
         WRITE(23,*) DT(J), EC(1,J), EP(1,J), ET(1,J)
      END DO
      CLOSE(23)
      
      

      END SUBROUTINE CALEYPOS
      
      END PROGRAM PENDSIMPALGVERLET

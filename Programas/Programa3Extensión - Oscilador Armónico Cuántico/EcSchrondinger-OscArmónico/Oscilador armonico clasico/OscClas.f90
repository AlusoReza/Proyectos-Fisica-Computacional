   PROGRAM OSCCLAS
   IMPLICIT NONE
   INTEGER*8:: NT, J
   REAL*8:: XM, PM, EM, DT, PI
   REAL*8, DIMENSION(0:5000)::X, V, P, T, U, E
   PARAMETER(PI = 4.D0*ATAN(1.D0))

   NT = 5000
   DT = 0.0001

   DO J = 0, NT
      X(J) = 0.5D0*COS(200.D0*DBLE(J*DT) + PI/2.D0) + 0.5D0
      V(J) = -100.D0*SIN(200*DBLE(J*DT) + PI/2.D0)
      P(J) = 0.5D0*V(J)**2.D0
      T(J) = 0.5D0*P(J)
      V(J) = 10000.D0*(X(J)-0.5D0)**2.D0
      E(J) = T(J) + V(J)
   END DO

   XM = 0.D0
   PM = 0.D0
   EM = 0.D0
   DO J = 0, NT
      XM = XM + X(J)
      PM = PM + P(J)
      EM = EM + E(J)
   END DO
   XM = XM/NT
   PM = PM/NT
   EM = EM/NT

   OPEN(UNIT=10, FILE= 'OSCCLAS.dat', STATUS='UNKNOWN')
   DO J = 0, 5000
      WRITE(10,*) '#T, X, V, P, T, V, E'
      WRITE(10,*) DBLE(J*DT), X(J), V(J), P(J), T(J), V(J), E(J)
   END DO   
   CLOSE(10)
   OPEN(UNIT=11, FILE= 'OSCCLASVALMED.dat', STATUS='UNKNOWN')
   WRITE(11,*) '#XM, PM, EM'
   WRITE(11,*) XM, PM, EM
   CLOSE(11)
   END PROGRAM OSCCLAS

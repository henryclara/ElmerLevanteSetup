FUNCTION getBasalFriction( Model, nodenumber, t ) RESULT( C )
        USE types
        USE CoordinateSystems
        USE SolverUtils
        USE ElementDescription
        USE DefUtils
        IMPLICIT NONE
        !header variables
        TYPE(Model_t) :: Model
        INTEGER :: nodenumber
        REAL(KIND=dp) :: x, C, yearinsec, t
        yearinsec = 365.25*24*60*60
        x = Model % Nodes % x(nodenumber) ! get coordinates
        
        IF (x < 140000) THEN
                C = 7.6e6/(1.0e6*yearinsec**(1.0/3.0))
        ELSE
                C = 7.6e7/(1.0e6*yearinsec**(1.0/3.0))
        END IF

END FUNCTION getBasalFriction

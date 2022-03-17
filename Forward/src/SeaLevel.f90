FUNCTION getSeaLevel( Model, nodenumber, t ) RESULT( SeaLevel )
        USE types
        USE CoordinateSystems
        USE SolverUtils
        USE ElementDescription
        USE DefUtils
        IMPLICIT NONE
        !header variables
        TYPE(Model_t) :: Model
        INTEGER :: nodenumber
        REAL(KIND=dp) :: SeaLevel, t
        
        IF ( t < 50 ) THEN
                SeaLevel = 0.0
        ELSE
                SeaLevel = 2.0 - 0.04*t
        END IF

        ! write(*,*) 'Sea level: ', SeaLevel
END FUNCTION getSeaLevel

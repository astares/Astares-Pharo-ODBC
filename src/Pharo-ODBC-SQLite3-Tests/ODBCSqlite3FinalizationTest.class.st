"
A test to verify correct finalization and cleaning up
"
Class {
	#name : #ODBCSqlite3FinalizationTest,
	#superclass : #TestCase,
	#category : #'Pharo-ODBC-SQLite3-Tests-Finalization'
}

{ #category : #tests }
ODBCSqlite3FinalizationTest >> testCorrectlyGarbageCollectWhenOpen [
	"For this test to run an SQL"
	|nrConnectionsBefore     conn nrConnectionHandlesBefore |

	Smalltalk garbageCollect. 
	nrConnectionsBefore := ODBCConnection allInstances size.
	nrConnectionHandlesBefore := ODBCSQLConnectionHandle allInstances size.
	
	conn := ODBCConnection dsn: 'pharo_sqlite64' user:  '' password: ''.
   conn open.

	self assert: ODBCConnection allInstances size equals: nrConnectionsBefore + 1.
	self assert: ODBCSQLConnectionHandle allInstances size equals: nrConnectionHandlesBefore + 2.  "The object and the executor (a shallow copy) for finalization - therefore one more."
	
	conn := nil.	"decouple"
	Smalltalk garbageCollect.
	Smalltalk garbageCollect.
	Smalltalk garbageCollect.

	"Connection object, connection handle and it's executor should be gone"
	self assert: ODBCConnection allInstances size equals: nrConnectionsBefore.
	self assert: ODBCSQLConnectionHandle allInstances size equals: nrConnectionHandlesBefore   

]

"
A test to verify correct finalization and cleaning up
"
Class {
	#name : #ODBCSqlite3FinalizationTest,
	#superclass : #TestCase,
	#category : #'Pharo-ODBC-SQLite3-Tests-Finalization'
}

{ #category : #tests }
ODBCSqlite3FinalizationTest >> testCorrectlyGarbageCollect [

	|nrConnectionsBefore nrConnectionHandlesBefore conn|

	Smalltalk garbageCollect. 
	nrConnectionsBefore := ODBCConnection allInstances size.
	nrConnectionHandlesBefore := ODBCSQLConnectionHandle allInstances size.
	
	conn := ODBCConnection dsn: 'pharo_sqlite64' user:  '' password: ''.

	self deny: conn isConnected.
	
	self assert: ODBCConnection allInstances size equals: nrConnectionsBefore + 1.
	
	"Internally no handle used yet when connection is not opened - so nr of instances should not increase"
	self assert: ODBCSQLConnectionHandle allInstances size equals: nrConnectionHandlesBefore.  
	
	conn := nil.	"decouple"
	Smalltalk garbageCollect.
	Smalltalk garbageCollect.
	Smalltalk garbageCollect.

	"Connection object, connection handle and it's executor should be gone"
	self assert: ODBCConnection allInstances size equals: nrConnectionsBefore.
	self assert: ODBCSQLConnectionHandle allInstances size equals: nrConnectionHandlesBefore   

]

{ #category : #tests }
ODBCSqlite3FinalizationTest >> testCorrectlyGarbageCollectWhenOpen [
	"For this test to run an SQL"
	|nrConnectionsBefore     conn nrConnectionHandlesBefore |

	Smalltalk garbageCollect. 
	nrConnectionsBefore := ODBCConnection allInstances size.
	nrConnectionHandlesBefore := ODBCSQLConnectionHandle allInstances size.
	
	conn := ODBCConnection dsn: 'pharo_sqlite64' user:  '' password: ''.
   conn open.

	self assert: conn isConnected.
	
	self assert: ODBCConnection allInstances size equals: nrConnectionsBefore + 1.
	
	"When connection is opened we internally should have one connection handle and as this one is registered for finalization 
	 another instance (which is a shallow copy of the original connection handle receiving the postmortem #finalize during GC)."
	self assert: ODBCSQLConnectionHandle allInstances size equals: nrConnectionHandlesBefore + 2.  
	
	conn := nil.	"decouple"
	Smalltalk garbageCollect.
	Smalltalk garbageCollect.
	Smalltalk garbageCollect.

	"Connection object, connection handle and it's executor should be gone"
	self assert: ODBCConnection allInstances size equals: nrConnectionsBefore.
	self assert: ODBCSQLConnectionHandle allInstances size equals: nrConnectionHandlesBefore   

]

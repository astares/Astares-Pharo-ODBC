Class {
	#name : #ODBCLibraryTest,
	#superclass : #TestCase,
	#category : #'Pharo-ODBC-UFFI-Tests-Library'
}

{ #category : #tests }
ODBCLibraryTest >> testUniqueInstance [

	self assert: ODBCLibrary uniqueInstance identicalTo: ODBCLibrary uniqueInstance
]

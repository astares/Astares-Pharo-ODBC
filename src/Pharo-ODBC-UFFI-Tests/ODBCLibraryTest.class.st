Class {
	#name : #ODBCLibraryTest,
	#superclass : #TestCase,
	#category : #'Pharo-ODBC-UFFI-Tests-Library'
}

{ #category : #tests }
ODBCLibraryTest >> testUniqueInstance [

	self assert: ODBCLibrary uniqueInstance == ODBCLibrary uniqueInstance
]

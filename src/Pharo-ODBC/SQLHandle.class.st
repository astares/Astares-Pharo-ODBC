"
An SQL handle
"
Class {
	#name : #SQLHandle,
	#superclass : #FFIExternalObject,
	#pools : [
		'ODBCConstants'
	],
	#category : #'Pharo-ODBC-UFFI'
}

{ #category : #resources }
SQLHandle class >> ffiLibraryName [ 
	^ODBCLibrary 
]

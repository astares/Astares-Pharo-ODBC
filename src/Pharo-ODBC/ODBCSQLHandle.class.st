"
An SQL handle
"
Class {
	#name : #ODBCSQLHandle,
	#superclass : #FFIExternalObject,
	#pools : [
		'ODBCConstants'
	],
	#category : #'Pharo-ODBC-UFFI-Handles'
}

{ #category : #resources }
ODBCSQLHandle class >> ffiLibraryName [ 
	^ODBCLibrary 
]

{ #category : #testing }
ODBCSQLHandle class >> isAbstract [ 

	^self name = #ODBCSQLHandle
]

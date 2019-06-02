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

{ #category : #finalization }
ODBCSQLHandle class >> finalizeResourceData: data [
	
	| ret |
	ret := self freeHandle: data.
	ret = SQL_SUCCESS 
				ifTrue: [ data beNull ]
				ifFalse: [ self error: 'Not able to free resource' ]
	
]

{ #category : #'private - finalization' }
ODBCSQLHandle class >> freeHandle: handle [

	self subclassResponsibility 

	
]

{ #category : #testing }
ODBCSQLHandle class >> isAbstract [ 

	^self name = #ODBCSQLHandle
]

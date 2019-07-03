"
An SQL handle
"
Class {
	#name : #ODBCSQLHandle,
	#superclass : #FFIExternalObject,
	#pools : [
		'ODBCSQLConstants',
		'ODBCSQLConstantsEx'
	],
	#category : #'Pharo-ODBC-UFFI-Model'
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
	"Free up the handle and its associated resources"	
		
	^self freeHandle: handle ofType: self sqlHandleType
]

{ #category : #'private - finalization' }
ODBCSQLHandle class >> freeHandle: handle ofType: aType [
	"Free up the handle and its associated resources"	
		
	^self ffiCall: #(SQLRETURN SQLFreeHandle (SQLSMALLINT aType, SQLHANDLE handle))
	
]

{ #category : #testing }
ODBCSQLHandle class >> isAbstract [ 

	^self name = #ODBCSQLHandle
]

{ #category : #debugging }
ODBCSQLHandle class >> log: aString [

	Transcript show: aString.
	Transcript cr.
	Transcript flush.
]

{ #category : #'private - accessing' }
ODBCSQLHandle class >> sqlHandleType [

	^self subclassResponsibility 
]

{ #category : #accessing }
ODBCSQLHandle >> ffiLibraryName [

	^self class ffiLibraryName
]

{ #category : #initialization }
ODBCSQLHandle >> initialize [ 
	super initialize.
	self autoRelease 
]

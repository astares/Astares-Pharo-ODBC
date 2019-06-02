"
A handle for a connection
"
Class {
	#name : #ODBCSQLConnectionHandle,
	#superclass : #ODBCSQLHandle,
	#category : #'Pharo-ODBC-UFFI-Handles'
}

{ #category : #'instance allocation' }
ODBCSQLConnectionHandle class >> allocate [
	<script: 'self allocate inspect'>
	|env ret conn |
	env := ODBCSQLEnvironmentHandle new.
	conn := self new.
	ret := self allocateOutputHandle: conn on: env handle value.
	^ret = SQL_SUCCESS 
		ifTrue: [ ^env ]
		ifFalse: [ self error: 'Not able to allocate ODBC connection: ', ret asString ]

]

{ #category : #'private - primitives' }
ODBCSQLConnectionHandle class >> allocateOutputHandle: outputHandle on: anEnvironmentHandle [

	^ self ffiCall: #(SQLRETURN SQLAllocHandle(SQL_HANDLE_DBC, SQL_NULL_HANDLE,  ODBCSQLConnectionHandle* outputHandle))
]

{ #category : #'private - finalization' }
ODBCSQLConnectionHandle class >> freeHandle: handle [
	"Free up the handle and its associated resources"	
		
	self ffiCall: #(SQLRETURN SQLFreeHandle (SQL_HANDLE_DBC, ODBCSQLConnectionHandle handle))
	
]

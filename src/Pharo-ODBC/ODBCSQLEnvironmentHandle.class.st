"
An environment handle
"
Class {
	#name : #ODBCSQLEnvironmentHandle,
	#superclass : #ODBCSQLHandle,
	#category : #'Pharo-ODBC-UFFI-Handles'
}

{ #category : #'instance allocation' }
ODBCSQLEnvironmentHandle class >> allocate [
	<script: 'self allocate inspect'>
	|env ret|
	env := self new.
	ret := self allocateOutputHandle: env.
	^ret = SQL_SUCCESS 
		ifTrue: [ ^env ]
		ifFalse: [ self error: 'Not able to allocate ODBC environment' ]

]

{ #category : #primitives }
ODBCSQLEnvironmentHandle class >> allocateOutputHandle: outputHandle [

	^ self ffiCall: #(SQLRETURN SQLAllocHandle (SQL_HANDLE_ENV, SQL_NULL_HANDLE,  #ODBCSQLEnvironmentHandle* outputHandle))
]

{ #category : #'private - finalization' }
ODBCSQLEnvironmentHandle class >> freeHandle: handle [
	"Free up the handle and its associated resources"	
		
	self ffiCall: #(SQLRETURN SQLFreeHandle (SQL_HANDLE_ENV, ODBCSQLEnvironmentHandle handle))
	
]

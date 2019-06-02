"
An environment handle
"
Class {
	#name : #SQLEnvironmentHandle,
	#superclass : #SQLHandle,
	#pools : [
		'ODBCConstants'
	],
	#category : #'Pharo-ODBC-UFFI'
}

{ #category : #'instance creation' }
SQLEnvironmentHandle class >> allocate [
	<script>
	|env x|
	env := self new.
	x := (self allocateOutputHandle: env).
	(Array with: env with: x) inspect
]

{ #category : #primitives }
SQLEnvironmentHandle class >> allocateOutputHandle: outputHandle [

	^ self ffiCall: #(SQLRETURN SQLAllocHandle (SQL_HANDLE_ENV, SQL_NULL_HANDLE,  SQLEnvironmentHandle* outputHandle))
]

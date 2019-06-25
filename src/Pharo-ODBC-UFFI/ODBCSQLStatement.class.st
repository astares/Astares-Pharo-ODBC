"
A handle for a SQL statement
"
Class {
	#name : #ODBCSQLStatement,
	#superclass : #ODBCSQLHandle,
	#category : #'Pharo-ODBC-UFFI-Model'
}

{ #category : #'private - accessing' }
ODBCSQLStatement class >> sqlHandleType [

	^SQL_HANDLE_STMT
]

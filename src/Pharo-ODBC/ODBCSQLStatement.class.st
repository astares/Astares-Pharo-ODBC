"
A handle for a SQL statement
"
Class {
	#name : #ODBCSQLStatement,
	#superclass : #ODBCSQLHandle,
	#category : #'Pharo-ODBC-UFFI-Handles'
}

{ #category : #'private - accessing' }
ODBCSQLStatement class >> sqlHandleType [

	^SQL_HANDLE_STMT
]

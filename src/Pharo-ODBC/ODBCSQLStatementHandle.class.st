"
A handle for a SQL statement
"
Class {
	#name : #ODBCSQLStatementHandle,
	#superclass : #ODBCSQLHandle,
	#category : #'Pharo-ODBC-UFFI-Handles'
}

{ #category : #'private - accessing' }
ODBCSQLStatementHandle class >> sqlHandleType [

	^SQL_HANDLE_STMT
]

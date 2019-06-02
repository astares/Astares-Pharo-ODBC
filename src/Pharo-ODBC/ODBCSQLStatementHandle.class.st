"
A handle for a SQL statement
"
Class {
	#name : #ODBCSQLStatementHandle,
	#superclass : #ODBCSQLHandle,
	#category : #'Pharo-ODBC-UFFI-Handles'
}

{ #category : #'private - finalization' }
ODBCSQLStatementHandle class >> freeHandle: handle [
	"Free up the handle and its associated resources"	
		
	self ffiCall: #(SQLRETURN SQLFreeHandle (SQL_HANDLE_STMT, ODBCSQLStatementHandle handle))
	
]

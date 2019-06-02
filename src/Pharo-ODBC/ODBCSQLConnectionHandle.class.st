"
A handle for a connection
"
Class {
	#name : #ODBCSQLConnectionHandle,
	#superclass : #ODBCSQLHandle,
	#category : #'Pharo-ODBC-UFFI-Handles'
}

{ #category : #'private - finalization' }
ODBCSQLConnectionHandle class >> freeHandle: handle [
	"Free up the handle and its associated resources"	
		
	self ffiCall: #(SQLRETURN SQLFreeHandle (SQL_HANDLE_DBC, ODBCSQLConnectionHandle handle))
	
]

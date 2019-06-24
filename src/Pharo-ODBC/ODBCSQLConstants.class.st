"
Some ODBC constant definitions
"
Class {
	#name : #ODBCSQLConstants,
	#superclass : #SharedPool,
	#classVars : [
		'SQLHANDLE',
		'SQLHDBC',
		'SQLHDESC',
		'SQLHENV',
		'SQLHSTMT',
		'SQLINTEGER',
		'SQLPOINTER',
		'SQLRETURN',
		'SQLSMALLINT',
		'SQLUSMALLINT',
		'SQL_ATTR_APP_PARAM_DESC',
		'SQL_ATTR_APP_ROW_DESC',
		'SQL_ATTR_AUTO_IPD',
		'SQL_ATTR_CURSOR_SCROLLABLE',
		'SQL_ATTR_CURSOR_SENSITIVITY',
		'SQL_ATTR_IMP_PARAM_DESC',
		'SQL_ATTR_IMP_ROW_DESC',
		'SQL_ATTR_METADATA_ID',
		'SQL_ATTR_OUTPUT_NTS',
		'SQL_DATA_AT_EXEC',
		'SQL_DATE_LEN',
		'SQL_DESC_ALLOC_TYPE',
		'SQL_DESC_CHARACTER_SET_CATALOG',
		'SQL_DESC_CHARACTER_SET_NAME',
		'SQL_DESC_CHARACTER_SET_SCHEMA',
		'SQL_DESC_COLLATION_CATALOG',
		'SQL_DESC_COLLATION_NAME',
		'SQL_DESC_COLLATION_SCHEMA',
		'SQL_DESC_COUNT',
		'SQL_DESC_DATA_PTR',
		'SQL_DESC_DATETIME_INTERVAL_CODE',
		'SQL_DESC_INDICATOR_PTR',
		'SQL_DESC_LENGTH',
		'SQL_DESC_NAME',
		'SQL_DESC_NULLABLE',
		'SQL_DESC_OCTET_LENGTH',
		'SQL_DESC_OCTET_LENGTH_PTR',
		'SQL_DESC_PRECISION',
		'SQL_DESC_SCALE',
		'SQL_DESC_TYPE',
		'SQL_DESC_UNNAMED',
		'SQL_DESC_USER_DEFINED_TYPE_CATALOG',
		'SQL_DESC_USER_DEFINED_TYPE_NAME',
		'SQL_DESC_USER_DEFINED_TYPE_SCHEMA',
		'SQL_DIAG_ALTER_DOMAIN',
		'SQL_DIAG_ALTER_TABLE',
		'SQL_DIAG_CALL',
		'SQL_DIAG_CLASS_ORIGIN',
		'SQL_DIAG_CONNECTION_NAME',
		'SQL_DIAG_CREATE_ASSERTION',
		'SQL_DIAG_CREATE_CHARACTER_SET',
		'SQL_DIAG_CREATE_COLLATION',
		'SQL_DIAG_CREATE_DOMAIN',
		'SQL_DIAG_CREATE_INDEX',
		'SQL_DIAG_CREATE_SCHEMA',
		'SQL_DIAG_CREATE_TABLE',
		'SQL_DIAG_CREATE_TRANSLATION',
		'SQL_DIAG_CREATE_VIEW',
		'SQL_DIAG_DELETE_WHERE',
		'SQL_DIAG_DROP_ASSERTION',
		'SQL_DIAG_DROP_CHARACTER_SET',
		'SQL_DIAG_DROP_COLLATION',
		'SQL_DIAG_DROP_DOMAIN',
		'SQL_DIAG_DROP_INDEX',
		'SQL_DIAG_DROP_SCHEMA',
		'SQL_DIAG_DROP_TABLE',
		'SQL_DIAG_DROP_TRANSLATION',
		'SQL_DIAG_DROP_VIEW',
		'SQL_DIAG_DYNAMIC_DELETE_CURSOR',
		'SQL_DIAG_DYNAMIC_FUNCTION',
		'SQL_DIAG_DYNAMIC_FUNCTION_CODE',
		'SQL_DIAG_DYNAMIC_UPDATE_CURSOR',
		'SQL_DIAG_GRANT',
		'SQL_DIAG_INSERT',
		'SQL_DIAG_MESSAGE_TEXT',
		'SQL_DIAG_NATIVE',
		'SQL_DIAG_NUMBER',
		'SQL_DIAG_RETURNCODE',
		'SQL_DIAG_REVOKE',
		'SQL_DIAG_ROW_COUNT',
		'SQL_DIAG_SELECT_CURSOR',
		'SQL_DIAG_SERVER_NAME',
		'SQL_DIAG_SQLSTATE',
		'SQL_DIAG_SUBCLASS_ORIGIN',
		'SQL_DIAG_UNKNOWN_STATEMENT',
		'SQL_DIAG_UPDATE_WHERE',
		'SQL_ERROR',
		'SQL_HANDLE_DBC',
		'SQL_HANDLE_DESC',
		'SQL_HANDLE_ENV',
		'SQL_HANDLE_STMT',
		'SQL_INVALID_HANDLE',
		'SQL_MAX_MESSAGE_LENGTH',
		'SQL_NEED_DATA',
		'SQL_NONSCROLLABLE',
		'SQL_NO_DATA',
		'SQL_NTS',
		'SQL_NTSL',
		'SQL_NULL_DATA',
		'SQL_NULL_HANDLE',
		'SQL_NULL_HDBC',
		'SQL_NULL_HDESC',
		'SQL_NULL_HENV',
		'SQL_NULL_HSTMT',
		'SQL_PARAM_DATA_AVAILABLE',
		'SQL_SCROLLABLE',
		'SQL_STILL_EXECUTING',
		'SQL_SUCCESS',
		'SQL_SUCCESS_WITH_INFO',
		'SQL_TIMESTAMP_LEN',
		'SQL_TIME_LEN'
	],
	#category : #'Pharo-ODBC-UFFI-Support'
}

{ #category : #initialization }
ODBCSQLConstants class >> initialize [

	self 
		initializeConstants;
		initializeTypes
]

{ #category : #'private - initialization constants' }
ODBCSQLConstants class >> initializeConnectionAttributes [

	SQL_ATTR_AUTO_IPD := 10001.
	SQL_ATTR_METADATA_ID := 10014
]

{ #category : #'private - initialization' }
ODBCSQLConstants class >> initializeConstants [
	<script>
	
	self 
		initializeSpecialLengthIndicators;
		initializeReturnValues;
		initializeFlagsForNullTerminatedString;
		initializeMaximumMessageLength;
		initializeDateTimeLengthConstants;
		initializeHandleTypeIdentifiers;
		initializeEnvironmentAttributes;
		initializeConnectionAttributes;
		initializeStatementAttributes;
		initializeSQLDescriptorFieldIdentifiers;
		initializeDiagnosticAreaFieldIdentifiers;
		initializeDynamicFunctionCodes;
		initializeNullHandles;
		initializeSQLTypes
]

{ #category : #'private - initialization constants' }
ODBCSQLConstants class >> initializeDateTimeLengthConstants [

	SQL_DATE_LEN := 10.
	SQL_TIME_LEN := 8.
	SQL_TIMESTAMP_LEN := 19.
]

{ #category : #'private - initialization constants' }
ODBCSQLConstants class >> initializeDiagnosticAreaFieldIdentifiers [

	SQL_DIAG_RETURNCODE := 1.
	SQL_DIAG_NUMBER := 2.
	SQL_DIAG_ROW_COUNT := 3.
	SQL_DIAG_SQLSTATE := 4.
	SQL_DIAG_NATIVE := 5.
	SQL_DIAG_MESSAGE_TEXT := 6.
	SQL_DIAG_DYNAMIC_FUNCTION := 7.
	SQL_DIAG_CLASS_ORIGIN := 8.
	SQL_DIAG_SUBCLASS_ORIGIN := 9.
	SQL_DIAG_CONNECTION_NAME := 10.
	SQL_DIAG_SERVER_NAME := 11.
	SQL_DIAG_DYNAMIC_FUNCTION_CODE := 12.
	
]

{ #category : #'private - initialization constants' }
ODBCSQLConstants class >> initializeDynamicFunctionCodes [

	SQL_DIAG_ALTER_DOMAIN := 3.
	SQL_DIAG_ALTER_TABLE := 4.
	SQL_DIAG_CALL := 7.
	SQL_DIAG_CREATE_ASSERTION := 6.
	SQL_DIAG_CREATE_CHARACTER_SET := 8.
	SQL_DIAG_CREATE_COLLATION := 10.
	SQL_DIAG_CREATE_DOMAIN := 23.
	SQL_DIAG_CREATE_INDEX := -1.
	SQL_DIAG_CREATE_SCHEMA := 64.
	SQL_DIAG_CREATE_TABLE := 77.
	SQL_DIAG_CREATE_TRANSLATION := 79.
	SQL_DIAG_CREATE_VIEW := 84.
	SQL_DIAG_DELETE_WHERE := 19.
	SQL_DIAG_DROP_ASSERTION := 24.
	SQL_DIAG_DROP_CHARACTER_SET := 25.
	SQL_DIAG_DROP_COLLATION := 26.
	SQL_DIAG_DROP_DOMAIN := 27.
	SQL_DIAG_DROP_INDEX := -2.
	SQL_DIAG_DROP_SCHEMA := 31.
	SQL_DIAG_DROP_TABLE := 32.
	SQL_DIAG_DROP_TRANSLATION := 33.
	SQL_DIAG_DROP_VIEW := 36.
	SQL_DIAG_DYNAMIC_DELETE_CURSOR := 38.
	SQL_DIAG_DYNAMIC_UPDATE_CURSOR := 81.
	SQL_DIAG_GRANT := 48.
	SQL_DIAG_INSERT := 50.
	SQL_DIAG_REVOKE := 59.
	SQL_DIAG_SELECT_CURSOR := 85.
	SQL_DIAG_UNKNOWN_STATEMENT := 0.
	SQL_DIAG_UPDATE_WHERE := 82.
	
]

{ #category : #'private - initialization constants' }
ODBCSQLConstants class >> initializeEnvironmentAttributes [

	SQL_ATTR_OUTPUT_NTS := 10001
]

{ #category : #'private - initialization constants' }
ODBCSQLConstants class >> initializeFlagsForNullTerminatedString [

	SQL_NTS := 3.               
	SQL_NTSL := 3
]

{ #category : #'private - initialization constants' }
ODBCSQLConstants class >> initializeHandleTypeIdentifiers [

	SQL_HANDLE_ENV := 1.
	SQL_HANDLE_DBC := 2.
	SQL_HANDLE_STMT := 3.
	SQL_HANDLE_DESC := 4.
]

{ #category : #'private - initialization constants' }
ODBCSQLConstants class >> initializeMaximumMessageLength [

	SQL_MAX_MESSAGE_LENGTH := 512
]

{ #category : #'private - initialization constants' }
ODBCSQLConstants class >> initializeNullHandles [

	SQL_NULL_HANDLE := 0.		"null handle used in place of parent handle when allocating HENV"
	
	"null handles returned by SQLAllocHandle()"
	SQL_NULL_HENV   := 0.
	SQL_NULL_HDBC   := 0.
	SQL_NULL_HSTMT  := 0.
	SQL_NULL_HDESC  := 0.
]

{ #category : #'private - initialization constants' }
ODBCSQLConstants class >> initializeReturnValues [

	SQL_SUCCESS	:= 0.
	SQL_SUCCESS_WITH_INFO := 1.
	
	SQL_ERROR := -1.
	SQL_INVALID_HANDLE := -2.
	SQL_STILL_EXECUTING := 2.
	
	SQL_NEED_DATA := 99.
	SQL_NO_DATA := 100.	
	SQL_PARAM_DATA_AVAILABLE := 101.
]

{ #category : #'private - initialization constants' }
ODBCSQLConstants class >> initializeSQLDescriptorFieldIdentifiers [

	SQL_DESC_COUNT := 1001.
	SQL_DESC_TYPE  := 1002.
	SQL_DESC_LENGTH := 1003.
	SQL_DESC_OCTET_LENGTH_PTR := 1004.
	SQL_DESC_PRECISION := 1005.
	SQL_DESC_SCALE := 1006.
	SQL_DESC_DATETIME_INTERVAL_CODE := 1007.
	SQL_DESC_NULLABLE := 1008.
	SQL_DESC_INDICATOR_PTR := 1009.
	SQL_DESC_DATA_PTR := 1010.
	SQL_DESC_NAME := 1011.
	SQL_DESC_UNNAMED := 1012.
	SQL_DESC_OCTET_LENGTH := 1013.
	SQL_DESC_ALLOC_TYPE := 1099.
	
	SQL_DESC_CHARACTER_SET_CATALOG := 1018.
	SQL_DESC_CHARACTER_SET_SCHEMA := 1019.
	SQL_DESC_CHARACTER_SET_NAME := 1020.
	SQL_DESC_COLLATION_CATALOG := 1015.
	SQL_DESC_COLLATION_SCHEMA := 1016.
	SQL_DESC_COLLATION_NAME := 1017. 
	SQL_DESC_USER_DEFINED_TYPE_CATALOG := 1026.
	SQL_DESC_USER_DEFINED_TYPE_SCHEMA := 1027.
	SQL_DESC_USER_DEFINED_TYPE_NAME := 1028
]

{ #category : #'private - initialization constants' }
ODBCSQLConstants class >> initializeSQLTypes [

	SQLSMALLINT := 'short'.
	SQLUSMALLINT := 'ushort'.
	SQLINTEGER := 'long'.
	SQLRETURN := SQLSMALLINT.
]

{ #category : #'private - initialization constants' }
ODBCSQLConstants class >> initializeSpecialLengthIndicators [

	SQL_NULL_DATA  := -1.
	SQL_DATA_AT_EXEC := -2

]

{ #category : #'private - initialization constants' }
ODBCSQLConstants class >> initializeStatementAttributes [

	SQL_ATTR_APP_ROW_DESC := 10010.
	SQL_ATTR_APP_PARAM_DESC := 10011.
	SQL_ATTR_IMP_ROW_DESC := 10012.
	SQL_ATTR_IMP_PARAM_DESC := 10013.
	SQL_ATTR_CURSOR_SCROLLABLE := -1.
	SQL_ATTR_CURSOR_SENSITIVITY := -2.
	
	"SQL_ATTR_CURSOR_SCROLLABLE values"
	SQL_NONSCROLLABLE := 0.
	SQL_SCROLLABLE := 1.
]

{ #category : #'private - initialization' }
ODBCSQLConstants class >> initializeTypes [
	<script>
	
	SQLPOINTER := 'void*'.
	
	SQLHANDLE := 'void*'.	
	SQLHENV   := #ODBCSQLEnvironmentHandle.
	SQLHDBC   := #ODBCSQLConnectionHandle.
	SQLHSTMT  := #ODBCSQLStatementHandle.
	SQLHDESC  := #ODBCSQLDescriptorHandle
]

"
A baseline for ODBC project
"
Class {
	#name : #BaselineOfODBC,
	#superclass : #BaselineOf,
	#category : #BaselineOfODBC
}

{ #category : #baseline }
BaselineOfODBC >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			package: 'Pharo-ODBC-UFFI';
			package: 'Pharo-ODBC-UFFI-Tests' with: [ spec requires: #('Pharo-ODBC-UFFI') ];
			package: 'Pharo-ODBC-Core';
			package: 'Pharo-ODBC-Core-Tests' with: [ spec requires: #('Pharo-ODBC-Core') ];
			package: 'Pharo-ODBC-SQLite3-Tests' with: [ spec requires: #('Pharo-ODBC-Core') ];
			package: 'Pharo-ODBC-UI' with: [ spec requires: #('Pharo-ODBC-Core') ].
	 
		spec 
			group: 'Core' with: #('Pharo-ODBC-Core' );
			group: 'Tests' with: #('Pharo-ODBC-UFFI-Tests' 'Pharo-ODBC-Core-Tests' 'Pharo-ODBC-SQLite3-Tests');
			group: 'UI' with: #('Pharo-ODBC-UI');
			group: 'default' with: #('UI' 'Tests');
			group: 'all' with: #('default'). ]
]

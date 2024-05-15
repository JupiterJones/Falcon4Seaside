Class {
	#name : #BaselineOfFalcon4Seaside,
	#superclass : #BaselineOf,
	#category : #BaselineOfFalcon4Seaside
}

{ #category : #loading }
BaselineOfFalcon4Seaside class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'Falcon4Seaside' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfFalcon4Seaside >> baseline: spec [
	<baseline>
	^ spec
		for: #common
		do: [ spec
				package: 'Falcon4Seaside-Knowledge';
				package: 'Falcon4Seaside-FileLibrary';
				package: 'Falcon4Seaside-Core';
				package: 'Falcon4Seaside-Localisation';
				package: 'Falcon4Seaside-Demo' ]
]

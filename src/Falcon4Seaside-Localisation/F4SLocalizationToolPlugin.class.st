Class {
	#name : #F4SLocalizationToolPlugin,
	#superclass : #WAToolPlugin,
	#category : #'Falcon4Seaside-Localisation'
}

{ #category : #accessing }
F4SLocalizationToolPlugin >> execute [
	self open: (F4SLocalisationTool on: self application)
]

{ #category : #accessing }
F4SLocalizationToolPlugin >> label [
	^ 'Localisation'
]

{ #category : #accessing }
F4SLocalizationToolPlugin >> priority [
	^ 850
]

Class {
	#name : #F4SLocalisationTool,
	#superclass : #WATool,
	#instVars : [
		'application'
	],
	#category : #'Falcon4Seaside-Localisation'
}

{ #category : #accessing }
F4SLocalisationTool class >> on: anApplication [
	^ self new
		application: anApplication;
		yourself
]

{ #category : #accessing }
F4SLocalisationTool >> application: anApplication [ 
	application := anApplication
]

{ #category : #accessing }
F4SLocalisationTool >> renderContentOn: canvas [
	canvas div
		class: 'tool';
		with: [ canvas paragraph: self rootComponentClass ]
]

{ #category : #accessing }
F4SLocalisationTool >> rootComponentClass [
	^ (application preferenceAt: #rootClass) value greaseString
]

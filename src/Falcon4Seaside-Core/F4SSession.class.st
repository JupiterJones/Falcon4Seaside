Class {
	#name : #F4SSession,
	#superclass : #WASession,
	#instVars : [
		'announcer',
		'user',
		'lockUser',
		'superUser',
		'lastAccessTime'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #initialiization }
F4SSession >> initializeFilters [
	super initializeFilters.
	self addFilter: WALocalizationContextFilter new
]

{ #category : #testing }
F4SSession >> isLoggedIn [
	^ user notNil
]

{ #category : #updating }
F4SSession >> logout [
  self user: nil
]

{ #category : #updating }
F4SSession >> user: anObject [
	user == anObject ifTrue: [ ^ self ].
	user ifNotNil: [ announcer announce: (F4SLoggedOut user: user) ].
	user := anObject.
	user ifNotNil: [ announcer announce: (F4SLoggedIn user: user) ]
]

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

{ #category : #accessing }
F4SSession >> initializeFilters [
	super initializeFilters.
	self addFilter: WALocalizationContextFilter new
]

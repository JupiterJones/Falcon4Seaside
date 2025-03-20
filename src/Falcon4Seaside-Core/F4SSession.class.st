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

{ #category : #'as yet unclassified' }
F4SSession >> initalizeSessionAnnouncements [
	announcer
		subscribe: F4SLogin
		do: [ :ann | self loginUser: ann user ]
		for: self.
	announcer
		subscribe: F4SLogout
		do: [ :ann | self logoutUser: ann user ]
		for: self.
	announcer
		subscribe: F4SLock
		do: [ :ann | self lockUser: ann user ]
		for: self.
	announcer
		subscribe: F4SUnlock
		do: [ :ann | self unlockUser: ann user ]
		for: self
]

{ #category : #'as yet unclassified' }
F4SSession >> initialize [
	super initialize.
	announcer := Announcer new.
	self initalizeSessionAnnouncements
]

{ #category : #initialiization }
F4SSession >> initializeFilters [
	super initializeFilters.
	self addFilter: WALocalizationContextFilter new
]

{ #category : #testing }
F4SSession >> isLocked [
	^ lockUser notNil
]

{ #category : #testing }
F4SSession >> isLoggedIn [
	^ user notNil
]

{ #category : #'as yet unclassified' }
F4SSession >> lockUser [
  ^ lockUser
]

{ #category : #'as yet unclassified' }
F4SSession >> lockUser: aUser [
	user := nil.
	lockUser := aUser
]

{ #category : #'as yet unclassified' }
F4SSession >> loginUser: aUser [
	user := aUser.
	lockUser := nil
]

{ #category : #updating }
F4SSession >> logout [
  self user: nil
]

{ #category : #'as yet unclassified' }
F4SSession >> logoutUser: aUser [
  user := nil
]

{ #category : #'as yet unclassified' }
F4SSession >> unlockUser: aUser [
	user := aUser.
	lockUser := nil
]

{ #category : #updating }
F4SSession >> user: anObject [
	user == anObject ifTrue: [ ^ self ].
	user ifNotNil: [ announcer announce: (F4SLogout user: user) ].
	user := anObject.
	user ifNotNil: [ announcer announce: (F4SLogin user: user) ]
]

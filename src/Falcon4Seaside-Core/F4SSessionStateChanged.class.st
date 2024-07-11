Class {
	#name : #F4SSessionStateChanged,
	#superclass : #F4SAnnouncement,
	#instVars : [
		'user'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #instance }
F4SSessionStateChanged class >> user: aUser [
	^ self new
		user: aUser;
		yourself
]

{ #category : #accessing }
F4SSessionStateChanged >> user [
	^ user
]

{ #category : #accessing }
F4SSessionStateChanged >> user: anObject [
	user := anObject
]

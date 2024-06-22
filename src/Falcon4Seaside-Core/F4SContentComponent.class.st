Class {
	#name : #F4SContentComponent,
	#superclass : #F4SCompositeComponent,
	#instVars : [
		'navItem'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #'instance creation' }
F4SContentComponent class >> navItem: aNavItem [
	^ self new
		navItem: aNavItem;
		yourself
]

{ #category : #initialization }
F4SContentComponent >> initialize [
	super initialize
]

{ #category : #accessing }
F4SContentComponent >> navItem: aNavItem [
	navItem := aNavItem
]

Class {
	#name : #F4SContentComponent,
	#superclass : #F4SCompositeComponent,
	#instVars : [
		'navItem'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #initialization }
F4SContentComponent >> initialize [
	super initialize
]

{ #category : #accessing }
F4SContentComponent >> navItem: aNavItem [
	navItem := aNavItem
]

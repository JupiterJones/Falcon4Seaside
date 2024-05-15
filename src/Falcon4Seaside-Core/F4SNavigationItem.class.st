Class {
	#name : #F4SNavigationItem,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'children',
		'component',
		'properties'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #defaults }
F4SNavigationItem class >> defaultBackgroundImage [
	^ nil
]

{ #category : #defaults }
F4SNavigationItem class >> defaultBadgeColor [
	^ nil
]

{ #category : #defaults }
F4SNavigationItem class >> defaultBadgeValue [
	^ nil
]

{ #category : #defaults }
F4SNavigationItem class >> defaultColumn [
	^ 0
]

{ #category : #defaults }
F4SNavigationItem class >> defaultComment [
	^ nil
]

{ #category : #defaults }
F4SNavigationItem class >> defaultIcon [
	^ nil
]

{ #category : #defaults }
F4SNavigationItem class >> defaultIconColor [
	^ nil
]

{ #category : #defaults }
F4SNavigationItem class >> defaultIsGroup [
	^ false
]

{ #category : #defaults }
F4SNavigationItem class >> defaultIsVisible [
	^ true
]

{ #category : #defaults }
F4SNavigationItem class >> defaultPromoteChildrenInTop [
	^ false
]

{ #category : #defaults }
F4SNavigationItem class >> defaultPromoteChildrenInVertical [
	^ false
]

{ #category : #defaults }
F4SNavigationItem class >> defaultRow [
	^ 0
]

{ #category : #defaults }
F4SNavigationItem class >> defaultSortPriorityTop [
	^ nil
]

{ #category : #defaults }
F4SNavigationItem class >> defaultSubTitle [
	^ nil
]

{ #category : #defaults }
F4SNavigationItem class >> defaultTitle [
	^ nil
]

{ #category : #defaults }
F4SNavigationItem class >> defaultTitleColor [
	^ nil
]

{ #category : #actions }
F4SNavigationItem >> addChild: aNavItem [
	children add: aNavItem.
	aNavItem parent: self
]

{ #category : #properties }
F4SNavigationItem >> backgroundImage [
	^ properties at: #backgroundImage ifAbsentPut: [ self defaultBackgroundImage ]
]

{ #category : #properties }
F4SNavigationItem >> backgroundImage: aUrl [
	properties at: #backgroundImage put: aUrl
]

{ #category : #properties }
F4SNavigationItem >> badgeColor [
	^ properties at: #badgeColor ifAbsentPut: [ self defaultBadgeColor ]
]

{ #category : #properties }
F4SNavigationItem >> badgeColor: aColor [
	properties at: #badgeColor put: aColor
]

{ #category : #properties }
F4SNavigationItem >> badgeValue [
	^ properties at: #badgeValue ifAbsentPut: [ self defaultBadgeValue ]
]

{ #category : #properties }
F4SNavigationItem >> badgeValue: aNumber [
	properties at: #badgeValue put: aNumber
]

{ #category : #actions }
F4SNavigationItem >> beGroup [
	self isGroup: true
]

{ #category : #actions }
F4SNavigationItem >> beHidden [
	self isVisible: false
]

{ #category : #'properties-cached' }
F4SNavigationItem >> buildNavigationLayout [
	| layout |
	layout := Dictionary new.
	self buildNavigationLayout: layout.
	^ layout
]

{ #category : #'properties-cached' }
F4SNavigationItem >> buildNavigationLayout: layout [
	parent
		ifNotNil: [ (layout at: self row @ self column ifAbsentPut: [ SortedCollection sortUsing: self topNavigationLayoutSortBlock ])
				add: self ].
	self isPositioned
		ifFalse: [ self children do: [ :child | child buildNavigationLayout: layout] ]
]

{ #category : #accessing }
F4SNavigationItem >> children [
	^ children
]

{ #category : #properties }
F4SNavigationItem >> column [
	^ properties at: #column ifAbsentPut: [ self defaultColumn ]
]

{ #category : #properties }
F4SNavigationItem >> column: anInteger [
	properties at: #column put: anInteger
]

{ #category : #'properties-cached' }
F4SNavigationItem >> columns [
	"Answer the max value of columns in my hierarchy"

	^ properties
		at: #cacheColumns
		ifAbsentPut: [ self children
				inject: self column
				into: [ :maxColumn :navItem | maxColumn max: navItem columns ] ]
]

{ #category : #properties }
F4SNavigationItem >> comment [
	^ properties at: #comment ifAbsentPut: [ self defaultComment ]
]

{ #category : #properties }
F4SNavigationItem >> comment: aString [
	properties at: #comment put: aString
]

{ #category : #accessing }
F4SNavigationItem >> component [
	^ component
]

{ #category : #accessing }
F4SNavigationItem >> component: aComponent [
	component := aComponent
			navItem: self;
			yourself
]

{ #category : #defaults }
F4SNavigationItem >> defaultBackgroundImage [
	^ self class defaultBackgroundImage
]

{ #category : #defaults }
F4SNavigationItem >> defaultBadgeColor [
	^ self class defaultBadgeColor
]

{ #category : #defaults }
F4SNavigationItem >> defaultBadgeValue [
	^ self class defaultBadgeValue
]

{ #category : #defaults }
F4SNavigationItem >> defaultColumn [
	^ self class defaultColumn
]

{ #category : #defaults }
F4SNavigationItem >> defaultComment [
	^ self class defaultComment
]

{ #category : #defaults }
F4SNavigationItem >> defaultIcon [
	^ self class defaultIcon
]

{ #category : #defaults }
F4SNavigationItem >> defaultIconColor [
	^ self class defaultIconColor
]

{ #category : #defaults }
F4SNavigationItem >> defaultIsGroup [
	^ self class defaultIsGroup
]

{ #category : #defaults }
F4SNavigationItem >> defaultIsVisible [
	^ self class defaultIsVisible
]

{ #category : #defaults }
F4SNavigationItem >> defaultPromoteChildrenInTop [
	^ self class defaultPromoteChildrenInTop
]

{ #category : #defaults }
F4SNavigationItem >> defaultPromoteChildrenInVertical [
	^ self class defaultPromoteChildrenInVertical
]

{ #category : #defaults }
F4SNavigationItem >> defaultRow [
	^ self class defaultRow
]

{ #category : #defaults }
F4SNavigationItem >> defaultSortPriorityTop [
	^ self class defaultSortPriorityTop
]

{ #category : #defaults }
F4SNavigationItem >> defaultSubTitle [
	^ self class defaultSubTitle
]

{ #category : #defaults }
F4SNavigationItem >> defaultTitle [
	^ self class defaultTitle
]

{ #category : #defaults }
F4SNavigationItem >> defaultTitleColor [
	^ self class defaultTitleColor
]

{ #category : #testing }
F4SNavigationItem >> hasBackgroundImage [
	^ self hasProperty: #backgroundImage
]

{ #category : #testing }
F4SNavigationItem >> hasChildren [
	^ children notEmpty
]

{ #category : #testing }
F4SNavigationItem >> hasProperty: aKey [
	^ properties includesKey: aKey
]

{ #category : #properties }
F4SNavigationItem >> icon [
	^ properties at: #icon ifAbsentPut: [ self defaultIcon ]
]

{ #category : #properties }
F4SNavigationItem >> icon: aString [
	properties at: #icon put: aString
]

{ #category : #properties }
F4SNavigationItem >> iconColor [
	^ properties at: #iconColor ifAbsentPut: [ self defaultIconColor ]
]

{ #category : #properties }
F4SNavigationItem >> iconColor: aColor [
	properties at: #iconColor put: aColor
]

{ #category : #initialization }
F4SNavigationItem >> initialize [
	super initialize.
	children := OrderedCollection new.
	properties := Dictionary new
]

{ #category : #properties }
F4SNavigationItem >> isGroup [
	^ properties at: #isGroup ifAbsentPut: [ self defaultIsGroup ]
]

{ #category : #properties }
F4SNavigationItem >> isGroup: aBoolean [
	properties at: #isGroup put: aBoolean
]

{ #category : #testing }
F4SNavigationItem >> isPositioned [
	"Answer true if myself or one of my parents is positioned"

	^ self row > 0 or: [ self column > 0 ]
]

{ #category : #properties }
F4SNavigationItem >> isVisible [
	"Show in menus"
	^ properties at: #isVisible ifAbsentPut: [ self defaultIsVisible ]
]

{ #category : #properties }
F4SNavigationItem >> isVisible: aBoolean [
	properties at: #isVisible put: aBoolean
]

{ #category : #searching }
F4SNavigationItem >> itemsForRow: aRow column: aColumn [
	| items |
	items := OrderedCollection new.
	(self row== aRow and: [ self column == aColumn ]) ifTrue: [ items add: self ]
]

{ #category : #'properties-cached' }
F4SNavigationItem >> layout [
	"Answer a dictionary with points for keys representing row@column and an OrderedCollection of values"

	^ properties
		at: #cacheLayout
		ifAbsentPut: [ self buildNavigationLayout ]
]

{ #category : #accessing }
F4SNavigationItem >> parent [
	^ parent
]

{ #category : #accessing }
F4SNavigationItem >> parent: aParent [
	parent := aParent
]

{ #category : #printing }
F4SNavigationItem >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self title;
		nextPut: $)
]

{ #category : #properties }
F4SNavigationItem >> promoteChildrenInTop [
	"Promote children up a level on the top navigation and remove myself"
	^ properties at: #promoteChildrenInTop ifAbsentPut: [ self defaultPromoteChildrenInTop ]
]

{ #category : #properties }
F4SNavigationItem >> promoteChildrenInTop: aBoolean [
	properties at: #promoteChildrenInTop put: aBoolean
]

{ #category : #actions }
F4SNavigationItem >> promoteChildrenInTopMenu [
	self promoteChildrenInTop: true
]

{ #category : #properties }
F4SNavigationItem >> promoteChildrenInVertical [
	"Promote children up a level on the vertical navigation and remove myself"
	^ properties at: #promoteChildrenInVertical ifAbsentPut: [ self defaultPromoteChildrenInVertical ]
]

{ #category : #properties }
F4SNavigationItem >> promoteChildrenInVertical: aBoolean [
	properties at: #promoteChildrenInVertical put: aBoolean
]

{ #category : #actions }
F4SNavigationItem >> promoteChildrenInVerticalMenu [
	self promoteChildrenInVertical: true
]

{ #category : #testing }
F4SNavigationItem >> renderOnCard [
	"Answer true if rows or columns are > 0"
	^ self rows > 0 or: [ self columns > 0 ]
]

{ #category : #properties }
F4SNavigationItem >> row [
	^ properties at: #row ifAbsentPut: [ self defaultRow ]
]

{ #category : #properties }
F4SNavigationItem >> row: anInteger [
	properties at: #row put: anInteger
]

{ #category : #navigation }
F4SNavigationItem >> row: rowInteger column: columnInteger [
	self
		row: rowInteger;
		column: columnInteger
]

{ #category : #'properties-cached' }
F4SNavigationItem >> rows [
	"Answer the max value of columns in my hierarchy"

	^ properties
		at: #cacheRows
		ifAbsentPut: [ self children
				inject: self row
				into: [ :maxRow :navItem | maxRow max: navItem rows ] ]
]

{ #category : #properties }
F4SNavigationItem >> sortPriorityTop [
	"Menus will be sorted based on sortPriorityTop"
	^ properties at: #sortPriorityTop ifAbsentPut: [ self defaultSortPriorityTop ]
]

{ #category : #properties }
F4SNavigationItem >> sortPriorityTop: anInteger [
	properties at: #sortPriorityTop put: anInteger
]

{ #category : #properties }
F4SNavigationItem >> subTitle [
	^ properties at: #subTitle ifAbsentPut: [ self defaultSubTitle ]
]

{ #category : #properties }
F4SNavigationItem >> subTitle: aString [
	properties at: #subTitle put: aString
]

{ #category : #properties }
F4SNavigationItem >> title [
	^ properties at: #title ifAbsentPut: [ self defaultTitle ]
]

{ #category : #properties }
F4SNavigationItem >> title: aString [
	properties at: #title put: aString
]

{ #category : #properties }
F4SNavigationItem >> titleColor [
	^ properties at: #titleColor ifAbsentPut: [ self defaultTitleColor ]
]

{ #category : #properties }
F4SNavigationItem >> titleColor: aColor [
	properties at: #titleColor put: aColor
]

{ #category : #'properties-cached' }
F4SNavigationItem >> topNavigationLayoutSortBlock [
	^ [ :a :b | 
	a sortPriorityTop isNil
		or: [ b sortPriorityTop isNil or: [ a sortPriorityTop < b sortPriorityTop ] ] ]
]

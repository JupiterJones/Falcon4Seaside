Class {
	#name : #F4SNavItem,
	#superclass : #Object,
	#instVars : [
		'parent',
		'children',
		'component',
		'properties'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #defaults }
F4SNavItem class >> defaultBackgroundImage [
	^ nil
]

{ #category : #defaults }
F4SNavItem class >> defaultBadgeColor [
	^ nil
]

{ #category : #defaults }
F4SNavItem class >> defaultBadgeValue [
	^ nil
]

{ #category : #defaults }
F4SNavItem class >> defaultColumn [
	^ 0
]

{ #category : #defaults }
F4SNavItem class >> defaultComment [
	^ nil
]

{ #category : #defaults }
F4SNavItem class >> defaultIcon [
	^ nil
]

{ #category : #defaults }
F4SNavItem class >> defaultIconColor [
	^ nil
]

{ #category : #defaults }
F4SNavItem class >> defaultIsGroup [
	^ false
]

{ #category : #defaults }
F4SNavItem class >> defaultIsVisible [
	^ true
]

{ #category : #defaults }
F4SNavItem class >> defaultPromoteChildrenInTop [
	^ false
]

{ #category : #defaults }
F4SNavItem class >> defaultPromoteChildrenInVertical [
	^ false
]

{ #category : #defaults }
F4SNavItem class >> defaultRow [
	^ 0
]

{ #category : #defaults }
F4SNavItem class >> defaultSortPriorityTop [
	^ nil
]

{ #category : #defaults }
F4SNavItem class >> defaultSubTitle [
	^ nil
]

{ #category : #defaults }
F4SNavItem class >> defaultTitle [
	^ nil
]

{ #category : #defaults }
F4SNavItem class >> defaultTitleColor [
	^ nil
]

{ #category : #testing }
F4SNavItem >> activeChild [
	"Answer nil or the child, or child of child that #isActive"

	self isActive ifTrue: [ ^ self ].
	children
		do: [ :child | child activeChild ifNotNil: [ :activeChild | ^ activeChild ] ].
	^ nil
]

{ #category : #actions }
F4SNavItem >> addChild: aNavItem [
	children add: aNavItem.
	aNavItem parent: self
]

{ #category : #properties }
F4SNavItem >> backgroundImage [
	^ properties at: #backgroundImage ifAbsentPut: [ self defaultBackgroundImage ]
]

{ #category : #properties }
F4SNavItem >> backgroundImage: aUrl [
	properties at: #backgroundImage put: aUrl
]

{ #category : #properties }
F4SNavItem >> badgeColor [
	^ properties at: #badgeColor ifAbsentPut: [ self defaultBadgeColor ]
]

{ #category : #properties }
F4SNavItem >> badgeColor: aColor [
	properties at: #badgeColor put: aColor
]

{ #category : #properties }
F4SNavItem >> badgeValue [
	^ properties at: #badgeValue ifAbsentPut: [ self defaultBadgeValue ]
]

{ #category : #properties }
F4SNavItem >> badgeValue: aNumber [
	properties at: #badgeValue put: aNumber
]

{ #category : #actions }
F4SNavItem >> beGroup [
	self isGroup: true
]

{ #category : #actions }
F4SNavItem >> beHidden [
	self isVisible: false
]

{ #category : #actions }
F4SNavItem >> beHome [
	self isHome: true
]

{ #category : #'properties-cached' }
F4SNavItem >> buildNavigationLayout [
	| layout |
	layout := Dictionary new.
	self buildNavigationLayout: layout.
	^ layout
]

{ #category : #'properties-cached' }
F4SNavItem >> buildNavigationLayout: layout [
	parent
		ifNotNil: [ (layout at: self row @ self column ifAbsentPut: [ SortedCollection sortUsing: self topNavigationLayoutSortBlock ])
				add: self ].
	self isPositioned
		ifFalse: [ self children do: [ :child | child buildNavigationLayout: layout] ]
]

{ #category : #accessing }
F4SNavItem >> children [
	^ children
]

{ #category : #properties }
F4SNavItem >> column [
	^ properties at: #column ifAbsentPut: [ self defaultColumn ]
]

{ #category : #properties }
F4SNavItem >> column: anInteger [
	properties at: #column put: anInteger
]

{ #category : #'properties-cached' }
F4SNavItem >> columns [
	"Answer the max value of columns in my hierarchy"

	^ properties
		at: #cacheColumns
		ifAbsentPut: [ self children
				inject: self column
				into: [ :maxColumn :navItem | maxColumn max: navItem columns ] ]
]

{ #category : #properties }
F4SNavItem >> comment [
	^ properties at: #comment ifAbsentPut: [ self defaultComment ]
]

{ #category : #properties }
F4SNavItem >> comment: aString [
	properties at: #comment put: aString
]

{ #category : #accessing }
F4SNavItem >> component [
	^ component
		ifNil: [ | p |
			self componentClass
				ifNotNil: [ :componentClass | 
					component := (p := self parentComponent)
							componentAt: self
							ifAbsentPut: [ componentClass parent: p ] ] ]
]

{ #category : #accessing }
F4SNavItem >> component: aComponent [
	component := aComponent
			navItem: self;
			yourself
]

{ #category : #'properties-cached' }
F4SNavItem >> componentClass [
	"Answer the component class. Used to lazily create the component"

	^ properties at: #componentClass ifAbsent: [ nil ]
]

{ #category : #properties }
F4SNavItem >> componentClass: aClass [
	properties at: #componentClass put: aClass
]

{ #category : #defaults }
F4SNavItem >> defaultBackgroundImage [
	^ self class defaultBackgroundImage
]

{ #category : #defaults }
F4SNavItem >> defaultBadgeColor [
	^ self class defaultBadgeColor
]

{ #category : #defaults }
F4SNavItem >> defaultBadgeValue [
	^ self class defaultBadgeValue
]

{ #category : #defaults }
F4SNavItem >> defaultColumn [
	^ self class defaultColumn
]

{ #category : #defaults }
F4SNavItem >> defaultComment [
	^ self class defaultComment
]

{ #category : #defaults }
F4SNavItem >> defaultIcon [
	^ self class defaultIcon
]

{ #category : #defaults }
F4SNavItem >> defaultIconColor [
	^ self class defaultIconColor
]

{ #category : #defaults }
F4SNavItem >> defaultIsGroup [
	^ self class defaultIsGroup
]

{ #category : #defaults }
F4SNavItem >> defaultIsVisible [
	^ self class defaultIsVisible
]

{ #category : #defaults }
F4SNavItem >> defaultPromoteChildrenInTop [
	^ self class defaultPromoteChildrenInTop
]

{ #category : #defaults }
F4SNavItem >> defaultPromoteChildrenInVertical [
	^ self class defaultPromoteChildrenInVertical
]

{ #category : #defaults }
F4SNavItem >> defaultRow [
	^ self class defaultRow
]

{ #category : #defaults }
F4SNavItem >> defaultSortPriorityTop [
	^ self class defaultSortPriorityTop
]

{ #category : #defaults }
F4SNavItem >> defaultSubTitle [
	^ self class defaultSubTitle
]

{ #category : #defaults }
F4SNavItem >> defaultTitle [
	^ self class defaultTitle
]

{ #category : #defaults }
F4SNavItem >> defaultTitleColor [
	^ self class defaultTitleColor
]

{ #category : #testing }
F4SNavItem >> hasBackgroundImage [
	^ self hasProperty: #backgroundImage
]

{ #category : #testing }
F4SNavItem >> hasChildren [
	^ children notEmpty
]

{ #category : #testing }
F4SNavItem >> hasProperty: aKey [
	^ properties includesKey: aKey
]

{ #category : #properties }
F4SNavItem >> icon [
	^ properties at: #icon ifAbsentPut: [ self defaultIcon ]
]

{ #category : #properties }
F4SNavItem >> icon: aString [
	properties at: #icon put: aString
]

{ #category : #properties }
F4SNavItem >> iconColor [
	^ properties at: #iconColor ifAbsentPut: [ self defaultIconColor ]
]

{ #category : #properties }
F4SNavItem >> iconColor: aColor [
	properties at: #iconColor put: aColor
]

{ #category : #initialization }
F4SNavItem >> initialize [
	super initialize.
	children := OrderedCollection new.
	properties := Dictionary new
]

{ #category : #testing }
F4SNavItem >> isActive [
	"I don't like this method because parentCompoent parent doesn't feel like a solid connection or understanding. It assumes knowledge that the parentCompoent parent is where this navigation stores it's selected component. It probably shouldn't, it should look after it's own selected component. This kind of smell probably means the navigation should be refactored"
	^ component == self parentComponent parent selectedComponent
]

{ #category : #properties }
F4SNavItem >> isGroup [
	^ properties at: #isGroup ifAbsentPut: [ self defaultIsGroup ]
]

{ #category : #properties }
F4SNavItem >> isGroup: aBoolean [
	properties at: #isGroup put: aBoolean
]

{ #category : #properties }
F4SNavItem >> isHome [
	^ properties at: #isHome ifAbsent: [ false ]
]

{ #category : #properties }
F4SNavItem >> isHome: aBoolean [
	properties at: #isHome put: aBoolean
]

{ #category : #testing }
F4SNavItem >> isInPathOfActiveNavItem [
	^ self activeChild notNil
]

{ #category : #testing }
F4SNavItem >> isPositioned [
	"Answer true if myself or one of my parents is positioned"

	^ self row > 0 or: [ self column > 0 ]
]

{ #category : #properties }
F4SNavItem >> isVisible [
	"Show in menus"
	^ properties at: #isVisible ifAbsentPut: [ self defaultIsVisible ]
]

{ #category : #properties }
F4SNavItem >> isVisible: aBoolean [
	properties at: #isVisible put: aBoolean
]

{ #category : #searching }
F4SNavItem >> itemsForRow: aRow column: aColumn [
	"For laying out menu items in top navigation"
	| items |
	items := OrderedCollection new.
	(self row== aRow and: [ self column == aColumn ]) ifTrue: [ items add: self ]
]

{ #category : #'properties-cached' }
F4SNavItem >> layout [
	"Answer a dictionary with points for keys representing row@column and an OrderedCollection of values"

	^ properties
		at: #cacheLayout
		ifAbsentPut: [ self buildNavigationLayout ]
]

{ #category : #accessing }
F4SNavItem >> parent [
	^ parent
]

{ #category : #accessing }
F4SNavItem >> parent: aParent [
	parent := aParent
]

{ #category : #accessing }
F4SNavItem >> parentComponent [
	^ parent class == F4SNavItem
		ifTrue: [ parent parentComponent ]
		ifFalse: [ parent ]
]

{ #category : #printing }
F4SNavItem >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self title;
		nextPut: $)
]

{ #category : #properties }
F4SNavItem >> promoteChildrenInTop [
	"Promote children up a level on the top navigation and remove myself"
	^ properties at: #promoteChildrenInTop ifAbsentPut: [ self defaultPromoteChildrenInTop ]
]

{ #category : #properties }
F4SNavItem >> promoteChildrenInTop: aBoolean [
	properties at: #promoteChildrenInTop put: aBoolean
]

{ #category : #actions }
F4SNavItem >> promoteChildrenInTopMenu [
	self promoteChildrenInTop: true
]

{ #category : #properties }
F4SNavItem >> promoteChildrenInVertical [
	"Promote children up a level on the vertical navigation and remove myself"
	^ properties at: #promoteChildrenInVertical ifAbsentPut: [ self defaultPromoteChildrenInVertical ]
]

{ #category : #properties }
F4SNavItem >> promoteChildrenInVertical: aBoolean [
	properties at: #promoteChildrenInVertical put: aBoolean
]

{ #category : #actions }
F4SNavItem >> promoteChildrenInVerticalMenu [
	self promoteChildrenInVertical: true
]

{ #category : #testing }
F4SNavItem >> renderOnCard [
	"Answer true if rows or columns are > 0"
	^ self rows > 0 or: [ self columns > 0 ]
]

{ #category : #properties }
F4SNavItem >> row [
	^ properties at: #row ifAbsentPut: [ self defaultRow ]
]

{ #category : #properties }
F4SNavItem >> row: anInteger [
	properties at: #row put: anInteger
]

{ #category : #navigation }
F4SNavItem >> row: rowInteger column: columnInteger [
	self
		row: rowInteger;
		column: columnInteger
]

{ #category : #'properties-cached' }
F4SNavItem >> rows [
	"Answer the max value of columns in my hierarchy"

	^ properties
		at: #cacheRows
		ifAbsentPut: [ self children
				inject: self row
				into: [ :maxRow :navItem | maxRow max: navItem rows ] ]
]

{ #category : #searching }
F4SNavItem >> search: searchBlock in: aCollection [
	aCollection
		do: [ :navItem | 
			(searchBlock value: navItem) ifTrue: [ ^ navItem ].
			(self search: searchBlock in: navItem children)
				ifNotNil: [ :foundNavItem | ^ foundNavItem ] ].
	^ nil
]

{ #category : #properties }
F4SNavItem >> sortPriorityTop [
	"Menus will be sorted based on sortPriorityTop"
	^ properties at: #sortPriorityTop ifAbsentPut: [ self defaultSortPriorityTop ]
]

{ #category : #properties }
F4SNavItem >> sortPriorityTop: anInteger [
	properties at: #sortPriorityTop put: anInteger
]

{ #category : #properties }
F4SNavItem >> subTitle [
	^ properties at: #subTitle ifAbsentPut: [ self defaultSubTitle ]
]

{ #category : #properties }
F4SNavItem >> subTitle: aString [
	properties at: #subTitle put: aString
]

{ #category : #properties }
F4SNavItem >> title [
	^ properties at: #title ifAbsentPut: [ self defaultTitle ]
]

{ #category : #properties }
F4SNavItem >> title: aString [
	properties at: #title put: aString
]

{ #category : #properties }
F4SNavItem >> titleColor [
	^ properties at: #titleColor ifAbsentPut: [ self defaultTitleColor ]
]

{ #category : #properties }
F4SNavItem >> titleColor: aColor [
	properties at: #titleColor put: aColor
]

{ #category : #'properties-cached' }
F4SNavItem >> topNavigationLayoutSortBlock [
	^ [ :a :b | 
	a sortPriorityTop isNil
		or: [ b sortPriorityTop isNil or: [ a sortPriorityTop < b sortPriorityTop ] ] ]
]

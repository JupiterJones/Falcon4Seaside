Class {
	#name : #F4SNavigationComponent,
	#superclass : #F4SAbstractComponent,
	#instVars : [
		'navigation'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #actions }
F4SNavigationComponent >> addNavItem: aNavItem [
	navigation add: aNavItem
]

{ #category : #accessing }
F4SNavigationComponent >> brandImageUrl [
	^ self fileLibraryClass / #imagesfaviconappletouchiconPng
]

{ #category : #accessing }
F4SNavigationComponent >> brandLabel [
	^ self root applicationName
]

{ #category : #accessing }
F4SNavigationComponent >> containerClass [
	"Answers 'container' or 'container-fluid'"

	^ String
		streamContents: [ :stream | 
			stream nextPutAll: 'container'.
			(self application configuration at: #isFluid)
				ifTrue: [ stream nextPutAll: '-fluid' ] ]
]

{ #category : #initialization }
F4SNavigationComponent >> initialize [
	super initialize.
	self initializeNavigation
]

{ #category : #initialization }
F4SNavigationComponent >> initializeNavigation [
	navigation := OrderedCollection new
]

{ #category : #'testing-navigation' }
F4SNavigationComponent >> isNavbarCard [
	^ (self application preferenceAt: #navbarStyle) = 'card'
]

{ #category : #'testing-navigation' }
F4SNavigationComponent >> isNavbarDoubleTop [
	^ (self application preferenceAt: #navbarPosition) = 'double-top'
]

{ #category : #'testing-navigation' }
F4SNavigationComponent >> isNavbarInverted [
	^ (self application preferenceAt: #navbarStyle) = 'inverted'
]

{ #category : #'testing-navigation' }
F4SNavigationComponent >> isNavbarTop [
	^ self isNavbarVertical not
]

{ #category : #'testing-navigation' }
F4SNavigationComponent >> isNavbarVertical [
	^ (self application preferenceAt: #navbarPosition) = 'vertical'
]

{ #category : #'testing-navigation' }
F4SNavigationComponent >> isNavbarVibrant [
	^ (self application preferenceAt: #navbarStyle) = 'vibrant'
]

{ #category : #initialization }
F4SNavigationComponent >> navigation: navigationItems [ 
	navigation := navigationItems
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderBadge: badgeValue on: canvas [
	^ canvas span
		class: 'badge rounded-pill ms-2 badge-subtle-success';
		with: [ canvas text: badgeValue ]
]

{ #category : #rendering }
F4SNavigationComponent >> renderBodyContentOn: canvas [
	canvas div
		class: 'content';
		with: [ self isNavbarVertical
				ifTrue: [ canvas navigation
						class: 'navbar navbar-light navbar-glass navbar-top navbar-expand';
						with: [ self
								renderNavigationToggleTarget: 'navbarVerticalCollapse'
								inContent: true
								on: canvas.
							self renderBrandInContent: true on: canvas.

							canvas unorderedList
								class: 'navbar-nav align-items-center d-none d-lg-block';
								with: [ canvas listItem
										class: 'nav-item';
										with: [ self renderSearchOn: canvas ] ].
							self renderNavigationActionsOn: canvas ] ].
			canvas render: self selectedComponent ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderBrandInContent: inContent on: canvas [
	"Another falcon mess."
	canvas anchor
		class: 'navbar-brand';
		class: 'me-1 me-sm-3' if: inContent;
		with: [ canvas div
				class: 'd-flex align-items-center';
				class: 'py-3' if: inContent not;
				with: [ canvas image
						class: 'me-2';
						url: self brandImageUrl;
						width: 40.
					canvas span
						class: 'font-sans-serif text-primary';
						with: [ canvas text: self brandLabel ] ] ]
]

{ #category : #rendering }
F4SNavigationComponent >> renderContentOn: canvas [
	canvas main
		class: 'main';
		id: 'top';
		with: [ canvas div
				class: self containerClass;
				attributeAt: 'data-layout' put: self containerClass;
				with: [ canvas script
						with: 'var isFluid = JSON.parse(localStorage.getItem("isFluid"));
          if (isFluid) {
            var container = document.querySelector("[data-layout]");
            container.classList.remove("container");
            container.classList.add("container-fluid");
          }'.

					self
						renderNavigationOn: canvas;
						renderBodyContentOn: canvas ] ]
]

{ #category : #rendering }
F4SNavigationComponent >> renderIcon: iconKey on: canvas [
	
	iconKey
		ifNotNil: [ canvas span
				class: 'nav-link-icon';
				with: [ canvas span
						class: self fontAwesomeClass;
						class: 'fa-' , iconKey ] ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationActionApplicationsMenuOn: canvas [
	| id |
	canvas listItem
		class: 'nav-item dropdown';
		with: [ canvas anchor
				id: (id := canvas nextId);
				class: 'nav-link pe-0 ps-2';
				attributeAt: 'role' put: 'button';
				attributeAt: 'data-hide-on-body-scroll' put: 'data-hide-on-body-scroll';
				attributeAt: 'data-bs-toggle' put: 'dropdown';
				attributeAt: 'aria-haspopup' put: 'true';
				attributeAt: 'aria-expanded' put: 'false';
				with: [ canvas div
						class: 'd-flex align-items-center';
						with: [ self renderIcon: 'th-large' on: canvas ] ].



			canvas div
				class: 'dropdown-menu dropdown-caret dropdown-menu-end dropdown-menu-card dropdown-caret-bg';
				attributeAt: 'aria-labelledby' put: id;
				with: [ canvas div
						class: 'card shadow-none';
						with: [ canvas div
								class: 'scrollbar-overlay nine-dots-dropdown';
								with: [ canvas div
										class: 'card-body px-3';
										with: [ canvas div
												class: 'row text-center gx-0 gy-0';
												with: [ canvas div
														class: 'col-4';
														with: [ canvas anchor
																class: 'd-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none';
																with: [ canvas div
																		class: 'd-flex align-items-center';
																		style: 'justify-content: center;';
																		with: [ self renderIcon: 'th-large fa-2x' on: canvas ].
																	canvas paragraph
																		class: 'mb-0 fw-medium text-800 text-truncate fs-11 pt-1';
																		with: [ canvas text: 'Frontend' ] ] ].
													canvas div
														class: 'col-4';
														with: [ canvas anchor
																class: 'd-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none';
																with: [ canvas div
																		class: 'd-flex align-items-center';
																		style: 'justify-content: center;';
																		with: [ self renderIcon: 'th-large fa-2x' on: canvas ].
																	canvas paragraph
																		class: 'mb-0 fw-medium text-800 text-truncate fs-11 pt-1';
																		with: [ canvas text: 'Backend' ] ] ].
													canvas div
														class: 'col-4';
														with: [ canvas anchor
																class: 'd-block hover-bg-200 px-2 py-3 rounded-3 text-center text-decoration-none';
																with: [ canvas div
																		class: 'd-flex align-items-center';
																		style: 'justify-content: center;';
																		with: [ self renderIcon: 'th-large fa-2x' on: canvas ].
																	canvas paragraph
																		class: 'mb-0 fw-medium text-800 text-truncate fs-11 pt-1';
																		with: [ canvas text: 'BI' ] ] ] ] ] ] ] ] ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationActionThemeSelectorOn: canvas [
	| faClass |
	faClass := self fontAwesomeClass.
	canvas listItem
		class: 'nav-item ps-2 pe-0';
		class: 'nav-link';
		with: [ canvas div
				class: 'dropdown theme-control-dropdown';
				with: [ canvas anchor
						id: 'themeSwitchDropdown';
						class: 'nav-link d-flex align-items-center fa-icon-wait fs-9 pe-1 py-0';
						class: 'dropdown-toggle' if: false; "Adds a caret to the right and spoils spacing"
						"url: '#';"
						attributeAt: 'role' put: 'button';
						attributeAt: 'data-bs-toggle' put: 'dropdown';
						attributeAt: 'aria-haspopup' put: 'true';
						attributeAt: 'aria-expanded' put: 'false';
						with: [ canvas span
								class: faClass;
								class: 'fa-sun fs-7';
								attributeAt: 'data-fa-transform' put: 'shrink-2';
								attributeAt: 'data-theme-dropdown-toggle-icon' put: 'light'.
							canvas span
								class: faClass;
								class: 'fa-moon fs-7';
								attributeAt: 'data-fa-transform' put: 'shrink-2';
								attributeAt: 'data-theme-dropdown-toggle-icon' put: 'dark'.
							canvas span
								class: faClass;
								class: 'fa-adjust fs-7';
								attributeAt: 'data-fa-transform' put: 'shrink-2';
								attributeAt: 'data-theme-dropdown-toggle-icon' put: 'auto' ].

					canvas div
						class: 'dropdown-menu dropdown-menu-end dropdown-caret border py-0 mt-3';
						attributeAt: 'aria-labelledby' put: 'themeSwitchDropdown';
						with: [ canvas div
								class: 'bg-white dark__bg-1000 rounded-2 py-2';
								with: [ canvas button
										bePush;
										class: 'dropdown-item d-flex align-items-center gap-2';
										attributeAt: 'value' put: 'light';
										attributeAt: 'data-theme-control' put: 'theme';
										with: [ canvas span
												class: faClass;
												class: 'fa-sun'.

											canvas text: 'Light'.
											canvas span
												class: faClass;
												class: 'fa-check dropdown-check-icon ms-auto text-600' ].
									canvas button
										bePush;
										class: 'dropdown-item d-flex align-items-center gap-2';
										attributeAt: 'value' put: 'dark';
										attributeAt: 'data-theme-control' put: 'theme';
										with: [ canvas span
												class: faClass;
												class: 'fa-moon'.

											canvas text: 'Dark'.
											canvas span
												class: faClass;
												class: 'fa-check dropdown-check-icon ms-auto text-600' ].

									canvas button
										bePush;
										class: 'dropdown-item d-flex align-items-center gap-2';
										attributeAt: 'value' put: 'auto';
										attributeAt: 'data-theme-control' put: 'theme';
										with: [ canvas span
												class: faClass;
												class: 'fa-adjust'.

											canvas text: 'Auto'.
											canvas span
												class: faClass;
												class: 'fa-check dropdown-check-icon ms-auto text-600' ] ] ] ] ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationActionUserMenuOn: canvas [
	canvas listItem
		class: 'nav-item dropdown';
		with: [ canvas anchor
				id: 'navbarDropdownUser';
				class: 'nav-link pe-0 ps-2';
				class: 'nav-link';
				attributeAt: 'role' put: 'button';
				attributeAt: 'data-bs-toggle' put: 'dropdown';
				attributeAt: 'aria-haspopup' put: 'true';
				attributeAt: 'aria-expanded' put: 'false';
				with: [ canvas div
						class: 'avatar avatar-xl';
						with: [ canvas image
								class: 'rounded-circle';
								url: F4SFalconDemoFileLibrary / #imgteam3thumbPng;
								altText: '' ] ].

			canvas div
				class: 'dropdown-menu dropdown-caret dropdown-menu-end py-0';
				attributeAt: 'aria-labelledby' put: 'navbarDropdownUser';
				with: [ canvas div
						class: 'bg-white dark__bg-1000 rounded-2 py-2';
						with: [ canvas anchor
								class: 'dropdown-item fw-bold text-warning';
								url: '#!';
								with: [ canvas span class: 'fas fa-crown me-1'.
									canvas text: 'Go Pro' ] ].
					canvas div class: 'dropdown-divider'.

					canvas anchor
						class: 'dropdown-item';
						url: '#!';
						with: [ canvas text: 'Set Status' ].
					canvas anchor
						class: 'dropdown-item';
						url: '#!';
						with: [ canvas text: 'My Account' ].
					canvas anchor
						class: 'dropdown-item';
						url: '#!';
						with: [ canvas text: 'Feedback' ].

					canvas div class: 'dropdown-divider'.

					canvas anchor
						class: 'dropdown-item';
						url: '#!';
						with: [ canvas text: 'Setings' ].
					canvas anchor
						class: 'dropdown-item';
						url: '#!';
						with: [ canvas text: 'Logout' ] ] ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationActionsOn: canvas [
	canvas unorderedList
		class: 'navbar-nav navbar-nav-icons ms-auto flex-row align-items-center';
		with: [ self
				renderNavigationActionThemeSelectorOn: canvas;
				renderNavigationActionApplicationsMenuOn: canvas;
				renderNavigationActionUserMenuOn: canvas ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationDoubleTopOn: canvas [
	canvas navigation
		class: 'navbar navbar-light';
		class: 'navbar-glass navbar-top navbar-expand-lg';
		with: [ canvas div
				class: 'w-100';
				with: [ canvas div
						class: 'd-flex flex-between-center';
						with: [ self
								renderNavigationToggleTarget: 'navbarTop'
								inContent: false
								on: canvas.
							self renderBrandInContent: false on: canvas.

							canvas unorderedList
								class: 'navbar-nav align-items-center d-none d-lg-block';
								with: [ canvas listItem
										class: 'nav-item';
										with: [ self renderSearchOn: canvas ] ].

							self renderNavigationActionsOn: canvas ].

					canvas horizontalRule class: 'my-2 d-none d-lg-block'.

					canvas div
						class: 'collapse navbar-collapse scrollbar';
						id: 'navbarTop';
						with: [ canvas unorderedList
								class: 'navbar-nav';
								attributeAt: 'data-top-nav-dropdowns' put: 'data-top-nav-dropdowns';
								with: [ self renderNavigationTopItems: navigation on: canvas ] ] ] ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationOn: canvas [
	self isNavbarVertical
		ifTrue: [ self renderNavigationVerticalOn: canvas ]
		ifFalse: [ self isNavbarDoubleTop
				ifTrue: [ self renderNavigationDoubleTopOn: canvas ]
				ifFalse: [ self renderNavigationTopOn: canvas ] ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationToggleTarget: target inContent: inContent on: canvas [
	"Falcon is a pretty messy framework in places - the navigation toggle being one of them.
	most of the messiness can be resolved from the navbar position except:
	
	target: is the id (string) of the div containing the navigation to toggle
	inContent: is true (boolean) if the toggle is in the 'content' div in the body of the document
			   and false if the toggle is being rendered in the first nav tag at the top of the page"

	| button |
	button := canvas button.
	button
		bePush;
		class: 'btn navbar-toggler-humburger-icon';
		class: 'navbar-toggler me-1 me-sm-3' if: (inContent or: [ self isNavbarTop ]).
	target
		ifNotNil: [ button
				attributeAt: 'data-bs-toggle' put: 'collapse';
				attributeAt: 'data-bs-target' put: '#' , target;
				attributeAt: 'aria-controls' put: target;
				attributeAt: 'aria-expanded' put: 'false';
				attributeAt: 'aria-label' put: 'Toggle Navigation' ].
	(self isNavbarVertical and: [ inContent not ])
		ifTrue: [ button
				class: 'navbar-vertical-toggle' if: inContent not;
				attributeAt: 'data-bs-toggle' put: 'tooltip';
				attributeAt: 'data-bs-placement' put: 'left';
				attributeAt: 'title' put: 'Toggle Navigation' ].
	button
		with: [ canvas span
				class: 'navbar-toggle-icon';
				with: [ canvas span class: 'toggle-line' ] ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationTopItem: navItem on: canvas [
	| dropdownId |
	canvas anchor
		class: 'nav-link dropdown-toggle';
		url: '#';
		attributeAt: 'role' put: 'button';
		attributeAt: 'data-bs-toggle' put: 'dropdown';
		attributeAt: 'aria-haspopup' put: 'true';
		attributeAt: 'aria-expanded' put: 'false';
		id: (dropdownId := canvas nextId);
		with: [ canvas text: navItem title ].
	canvas div
		class: 'dropdown-menu dropdown-caret dropdown-menu-card border-0 mt-0';
		attributeAt: 'aria-labelledby' put: dropdownId;
		with: [ navItem renderOnCard
				ifTrue: [ self renderNavigationTopLayoutItem: navItem on: canvas ]
				ifFalse: [ self renderNavigationTopSimpleItem: navItem on: canvas ] ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationTopItems: menuItems on: canvas [
	menuItems
		do: [ :menuItem | 
			canvas listItem
				class: 'nav-item dropdown';
				with: [ self renderNavigationTopItem: menuItem on: canvas ] ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationTopLayoutItem: navItem on: canvas [
	canvas div
		class: 'card shadow-none dark__bg-1000';
		class: 'navbar-card-col-' , navItem columns asString;
		style: 'min-width: ', (12  * navItem columns) asString, 'rem;';
		with: [ canvas div
				class: 'card-body scrollbar max-h-dropdow';
				with: [ navItem backgroundImage
						ifNotNil: [ canvas image
								class: 'img-dropdown';
								width: 130;
								url: navItem backgroundImage ].
					1
						to: navItem rows
						do: [ :row | 
							canvas div
								class: 'row';
								with: [ 1
										to: navItem columns
										do: [ :column | 
											canvas div
												class: 'col-6';
												class: 'col-md-4' if: navItem columns = 3;
												class: 'col-xxl-3' if: navItem columns = 4;
												with: [ canvas div
														class: 'nav flex-column';
														with: [ navItem layout
																at: row @ column
																ifPresent: [ :items | self renderNavigationTopLayoutLinks: items on: canvas ] ] ] ] ] ] ] ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationTopLayoutLinks: navItems on: canvas [
	navItems
		do: [ :navItem "Do we promote children?" | 
			navItem promoteChildrenInTop
				ifTrue: [ self renderNavigationTopLayoutLinks: navItem children on: canvas ]
				ifFalse: [ navItem hasChildren
						ifTrue: [ canvas paragraph
								class: 'nav-link text-700 mb-0 fw-bold';
								with: [ canvas text: navItem title.
									navItem badgeValue
										ifNotNil: [ self renderBadge: navItem badgeValue on: canvas ] ].

							self renderNavigationTopLayoutLinks: navItem children on: canvas ]
						ifFalse: [ canvas anchor
								class: 'nav-link py-1 link-600 fw-medium';
								with: [ canvas text: navItem title.
									navItem badgeValue
										ifNotNil: [ self renderBadge: navItem badgeValue on: canvas ] ] ] ] ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationTopOn: canvas [
	canvas navigation
		class: 'navbar navbar-light';
		class: 'navbar-glass navbar-top navbar-expand-lg';
		with: [ self
				renderNavigationToggleTarget: 'navbarTop'
				inContent: false
				on: canvas.
			self renderBrandInContent: false on: canvas.

			canvas div
				class: 'collapse navbar-collapse scrollbar';
				id: 'navbarTop';
				with: [ canvas unorderedList
						class: 'navbar-nav';
						attributeAt: 'data-top-nav-dropdowns' put: 'data-top-nav-dropdowns';
						with: [ self renderNavigationTopItems: navigation on: canvas ] ].
			self renderNavigationActionsOn: canvas ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationTopSimpleItem: navItem on: canvas [
	canvas div
		class: 'bg-white dark__bg-1000 rounded-3 py-2';
		with: [ navItem children
				do: [ :item | 
					canvas anchor
						class: 'dropdown-item link-600 fw-medium';
						with: [ canvas text: item title.
							item badgeValue ifNotNil: [ self renderBadge: item badgeValue on: canvas ] ] ] ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationVerticalItem: navItem on: canvas [
	canvas listItem
		class: 'nav-item';
		with: [ (navItem isGroup or: [ navItem children notEmpty ])
				ifTrue: [ navItem isGroup
						ifTrue: [ self
								renderNavigationVerticalItemGroup: navItem on: canvas;
								renderNavigationVerticalItems: navItem children on: canvas ]
						ifFalse: [  "This is a menu dropdown"| dropdownId |
							dropdownId := canvas nextId.
							self
								renderNavigationVerticalItemDropdown: navItem
								id: dropdownId
								on: canvas.
							navItem children notEmpty
								ifTrue: [ canvas unorderedList
										class: 'nav collapse';
										id: dropdownId;
										with: [ self renderNavigationVerticalItems: navItem children on: canvas ] ] ] ]
				ifFalse: [ canvas anchor
						class: 'nav-link';
						with: [ canvas div
								class: 'd-flex align-items-center';
								with: [ self renderIcon: navItem icon on: canvas.
									canvas span
										class: 'nav-link-text ps-1';
										with: [ canvas text: navItem title ].
									navItem badgeValue
										ifNotNil: [ self renderBadge: navItem badgeValue on: canvas ] ] ] ] ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationVerticalItemDropdown: navItem id: dropdownId on: canvas [
	canvas anchor
		url: '#' , dropdownId;
		class: 'nav-link dropdown-indicator';
		attributeAt: 'role' put: 'button';
		attributeAt: 'data-bs-toggle' put: 'collapse';
		attributeAt: 'aria-expanded' put: 'false';
		attributeAt: 'aria-controls' put: dropdownId;
		with: [ canvas div
				class: 'd-flex align-items-center';
				with: [ self renderIcon: navItem icon on: canvas.

					canvas span
						class: 'nav-link-text ps-1';
						with: [ canvas text: navItem title ] ] ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationVerticalItemGroup: navGroup on: canvas [
	canvas div
		class: 'row navbar-vertical-label-wrapper mt-3 mb-2';
		with: [ canvas div
				class: 'col-auto navbar-vertical-label';
				with: [ canvas text: navGroup title ].
			canvas div
				class: 'col ps-0';
				with: [ canvas horizontalRule class: 'mb-0 navbar-vertical-divider' ] ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationVerticalItems: navItems on: canvas [
	| navItemsToRender |
	navItemsToRender := navItems
			inject: OrderedCollection new
			into: [ :items :navItem | 
				navItem isVisible
					and: [ navItem promoteChildrenInVertical
							ifTrue: [ items addAll: navItem children ]
							ifFalse: [ items add: navItem ] ].
				items ].
	navItemsToRender
		do: [ :navItem | self renderNavigationVerticalItem: navItem on: canvas ]
]

{ #category : #'rendering-navigation' }
F4SNavigationComponent >> renderNavigationVerticalOn: canvas [
	canvas navigation
		class: 'navbar navbar-light';
		class: 'navbar-vertical navbar-expand-xl';
		class: 'navbar-card' if: self isNavbarCard;
		class: 'navbar-inverted' if: self isNavbarInverted;
		class: 'navbar-vibrant' if: self isNavbarVibrant;
		with: [ canvas script
				with: 'var navbarStyle = localStorage.getItem("navbarStyle");
	if (navbarStyle && navbarStyle !== "transparent") {
		document.querySelector(".navbar-vertical").classList.add("navbar-${navbarStyle}");
	}'.
			canvas div
				class: 'd-flex align-items-center';
				with: [ canvas div
						class: 'toggle-icon-wrapper';
						with: [ self renderNavigationToggleTarget: nil inContent: false on: canvas ].
					self renderBrandInContent: false on: canvas ].
			canvas div
				class: 'collapse navbar-collapse';
				id: 'navbarVerticalCollapse';
				with: [ canvas div
						class: 'navbar-vertical-content scrollbar';
						with: [ canvas unorderedList
								class: 'navbar-nav flex-column mb-3';
								id: 'navbarVerticalNav';
								with: [ self renderNavigationVerticalItems: navigation on: canvas ] ] ] ]
]

{ #category : #'rendering-search' }
F4SNavigationComponent >> renderSearchOn: canvas [
	canvas render: self searchComponent
]

{ #category : #'rendering-search' }
F4SNavigationComponent >> searchComponent [
	^self
		componentAt: #globalSearch
		ifAbsentPut: [ F4SSearchComponent parent: self ]
]

{ #category : #updating }
F4SNavigationComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot
]

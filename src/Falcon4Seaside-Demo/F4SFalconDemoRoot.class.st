Class {
	#name : #F4SFalconDemoRoot,
	#superclass : #F4SRootComponent,
	#category : #'Falcon4Seaside-Demo'
}

{ #category : #accessing }
F4SFalconDemoRoot class >> applicationName [
	^ 'falcon'
]

{ #category : #accessing }
F4SFalconDemoRoot class >> fileLibraryClass [
	^ F4SFalconDemoFileLibrary
]

{ #category : #accessing }
F4SFalconDemoRoot class >> windowTitle [
	^ 'Falcon | Dashboard & Web App Template'
]

{ #category : #accessing }
F4SFalconDemoRoot >> adminComponent [
	^ self componentAt: #admin ifAbsentPut: [ F4SDefaultDashboard parent: self ]
]

{ #category : #navigation }
F4SFalconDemoRoot >> appNavigation [
	^ F4SNavItem new
		title: 'App' seasideTranslated;
		beGroup;
		backgroundImage: F4SFalconDemoFileLibrary / #'imgiconsspotillustrationsauthenticationcornerPng';
		addChild: (F4SNavItem new
				title: 'Calendar' seasideTranslated;
				icon: 'calendar-alt';
				row: 1 column: 1;
				yourself);
		addChild: (F4SNavItem new
				title: 'Chat' seasideTranslated;
				icon: 'comments';
				row: 1 column: 1;
				yourself);
		addChild: (F4SNavItem new
				title: 'Email' seasideTranslated;
				icon: 'envelope-open';
				sortPriorityTop: 300;
				row: 1 column: 2;
				addChild: (F4SNavItem new
						title: 'Inbox' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Email Detail' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Compose' seasideTranslated;
						yourself);
				yourself);
		addChild: (F4SNavItem new
				title: 'Events' seasideTranslated;
				icon: 'calendar-day';
				sortPriorityTop: 200;
				row: 1 column: 2;
				addChild: (F4SNavItem new
						title: 'Create an Event' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Event Detail' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Event List' seasideTranslated;
						yourself);
				yourself);
		addChild: (F4SNavItem new
				title: 'E-Commerce' seasideTranslated;
				icon: 'shopping-cart';
				row: 1 column: 3;
				addChild: (F4SNavItem new
						title: 'Product' seasideTranslated;
						promoteChildrenInTopMenu;
						icon: 'box';
						addChild: (F4SNavItem new
								title: 'Product List' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Product Grid' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Product Details' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Add Product' seasideTranslated;
								yourself);
						yourself);
				addChild: (F4SNavItem new
						title: 'Orders' seasideTranslated;
						promoteChildrenInTopMenu;
						addChild: (F4SNavItem new
								title: 'Order List' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Order Details' seasideTranslated;
								yourself);
						yourself);
				addChild: (F4SNavItem new
						title: 'Customers' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Customer Details' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Shopping Cart' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Checkout' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Billing' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Invoice' seasideTranslated;
						yourself);
				yourself);
		addChild: (F4SNavItem new
				title: 'E-Learning' seasideTranslated;
				icon: 'graduation-cap';
				sortPriorityTop: 100;
				row: 1 column: 2;
				addChild: (F4SNavItem new
						title: 'Course' seasideTranslated;
						promoteChildrenInTopMenu;
						addChild: (F4SNavItem new
								title: 'Course List' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Course Grid' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Course Details' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Create a Course' seasideTranslated;
								yourself);
						yourself);
				addChild: (F4SNavItem new
						title: 'Student Overview' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Student Profile' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Trainer Profile' seasideTranslated;
						yourself);
				yourself);
		addChild: (F4SNavItem new
				title: 'Kanban' seasideTranslated;
				icon: 'trello';
				row: 1 column: 1;
				yourself);
		addChild: (F4SNavItem new
				title: 'Social' seasideTranslated;
				icon: 'share-alt';
				row: 1 column: 1;
				addChild: (F4SNavItem new
						title: 'Feed' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Activity Log' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Notifications' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Followers' seasideTranslated;
						yourself);
				yourself);
		addChild: (F4SNavItem new
				title: 'Support Desk' seasideTranslated;
				icon: 'ticket-alt';
				row: 1 column: 1;
				addChild: (F4SNavItem new
						title: 'Table View' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Card View' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Contacts' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Contact Details' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Tickets Preview' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Quick Links' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Reports' seasideTranslated;
						yourself);
				yourself);
		yourself
]

{ #category : #navigation }
F4SFalconDemoRoot >> dashboardNavigation [
	^ F4SNavItem new
		title: 'Dashboard' seasideTranslated;
		icon: 'chart-pie';
		addChild: (F4SNavItem new
				title: 'Default';
				componentClass: F4SDefaultDashboard;
				yourself);
		addChild: (F4SNavItem new
				title: 'Analytics' seasideTranslated;
				yourself);
		addChild: (F4SNavItem new
				title: 'CRM' seasideTranslated;
				yourself);
		addChild: (F4SNavItem new
				title: 'E commerce' seasideTranslated;
				yourself);
		addChild: (F4SNavItem new
				title: 'LMS' seasideTranslated;
				badgeValue: 'New';
				yourself);
		addChild: (F4SNavItem new
				title: 'Management' seasideTranslated;
				yourself);
		addChild: (F4SNavItem new
				title: 'SAAS' seasideTranslated;
				yourself);
		addChild: (F4SNavItem new
				title: 'Support Desk' seasideTranslated;
				badgeValue: 'New';
				yourself);
		yourself
]

{ #category : #accessing }
F4SFalconDemoRoot >> initialComponent [
	^ self landingComponent
]

{ #category : #initalization }
F4SFalconDemoRoot >> initializeNavigation [
	super initializeNavigation.
	self navigationComponent 
		addNavItem: self topLevelNavigation;
		addNavItem: self dashboardNavigation;
		addNavItem: self appNavigation;
		addNavItem: self pagesNavigation
]

{ #category : #accessing }
F4SFalconDemoRoot >> landingComponent [
	^ self componentAt: #admin ifAbsentPut: [ F4SLandingComponent parent: self ]
]

{ #category : #navigation }
F4SFalconDemoRoot >> pagesNavigation [
	^ F4SNavItem new
		title: 'Pages' seasideTranslated;
		beGroup;
		backgroundImage: F4SFalconDemoFileLibrary / #'imgiconsspotillustrationsauthenticationcornerPng';
		addChild: (F4SNavItem new
				title: 'Others' seasideTranslated;
				row: 1 column: 4;
				sortPriorityTop: 200;
				promoteChildrenInVerticalMenu;
				addChild: (F4SNavItem new
						title: 'Starter' seasideTranslated;
						icon: 'flag';
						yourself);
				addChild: (F4SNavItem new
						title: 'Landing' seasideTranslated;
						icon: 'globe';
						yourself);
				yourself);
		addChild: (F4SNavItem new
				title: 'Authentication' seasideTranslated;
				icon: 'lock';
				addChild: (F4SNavItem new
						title: 'Simple' seasideTranslated;
						row: 1 column: 1;
						addChild: (F4SNavItem new
								title: 'Login' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Logout' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Register' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Forgot Password' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Confirm Mail' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Reset Password' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Lock Screen' seasideTranslated;
								yourself);
						yourself);
				addChild: (F4SNavItem new
						title: 'Card' seasideTranslated;
						row: 1 column: 2;
						addChild: (F4SNavItem new
								title: 'Login' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Logout' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Register' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Forgot Password' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Confirm Mail' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Reset Password' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Lock Screen' seasideTranslated;
								yourself);
						yourself);
				addChild: (F4SNavItem new
						title: 'Split' seasideTranslated;
						row: 1 column: 3;
						addChild: (F4SNavItem new
								title: 'Login' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Logout' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Register' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Forgot Password' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Confirm Mail' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Reset Password' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Lock Screen' seasideTranslated;
								yourself);
						yourself);
				addChild: (F4SNavItem new
						title: 'Other Auth';
						promoteChildrenInVerticalMenu;
						row: 3 column: 3;
						addChild: (F4SNavItem new
								title: 'Wizzard' seasideTranslated;
								yourself);
						addChild: (F4SNavItem new
								title: 'Modal' seasideTranslated;
								yourself);
						yourself);
				yourself);
		addChild: (F4SNavItem new
				title: 'User' seasideTranslated;
				icon: 'user';
				row: 2 column: 1;
				addChild: (F4SNavItem new
						title: 'Profile' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Settings' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Event List' seasideTranslated;
						yourself);
				yourself);
		addChild: (F4SNavItem new
				title: 'Pricing' seasideTranslated;
				icon: 'tags';
				row: 2 column: 2;
				addChild: (F4SNavItem new
						title: 'Pricing Default' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Pricing Alternate' seasideTranslated;
						yourself);
				yourself);
		addChild: (F4SNavItem new
				title: 'FAQ' seasideTranslated;
				icon: 'question-circle';
				row: 3 column: 2;
				addChild: (F4SNavItem new
						title: 'FAQ Basic' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'FAQ Default' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'FAQ Accordian' seasideTranslated;
						yourself);
				yourself);
		addChild: (F4SNavItem new
				title: 'Errors' seasideTranslated;
				icon: 'exclamation-triangle';
				row: 2 column: 3;
				addChild: (F4SNavItem new
						title: '404';
						yourself);
				addChild: (F4SNavItem new
						title: '500';
						yourself);
				yourself);
		addChild: (F4SNavItem new
				title: 'Miscellaneous' seasideTranslated;
				icon: 'thumbtack';
				row: 3 column: 1;
				addChild: (F4SNavItem new
						title: 'Associations' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Invite People' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Privacy Policy' seasideTranslated;
						yourself);
				yourself);
		addChild: (F4SNavItem new
				title: 'Layouts' seasideTranslated;
				icon: 'window-restore';
				row: 1 column: 4;
				sortPriorityTop: 100;
				addChild: (F4SNavItem new
						title: 'Vertical Nav' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Top Nav' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Double Top Nav' seasideTranslated;
						yourself);
				addChild: (F4SNavItem new
						title: 'Combo Nav' seasideTranslated;
						yourself);
				yourself);
		yourself
]

{ #category : #navigation }
F4SFalconDemoRoot >> topLevelNavigation [
	^ F4SNavItem new
		title: 'Loose pages not in menu';
		beHidden;
		addChild: (F4SNavItem new
				title: 'Home' seasideTranslated;
				icon: 'home';
				componentClass: F4SLandingComponent;
				beHome;
				yourself);
		yourself
]

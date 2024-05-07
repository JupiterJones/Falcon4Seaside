Class {
	#name : #F4SFalconDemo,
	#superclass : #F4SRootComponent,
	#category : #'Falcon4Seaside-Demo'
}

{ #category : #installing }
F4SFalconDemo class >> applicationName [
	^ 'falcon'
]

{ #category : #navigation }
F4SFalconDemo >> appNavigation [
	^ F4SNavItem new
		title: 'App' seasideTranslated;
		beGroup;
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
				row: 1 column: 2;
				addChild: (F4SNavItem new
						title: 'Course' seasideTranslated;
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
F4SFalconDemo >> dashboardNavigation [
	^ F4SNavItem new
		title: 'Dashboard' seasideTranslated;
		icon: 'chart-pie';
		addChild: (F4SNavItem new
				title: 'Default';
				component: F4SDefaultDashboard new;
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
				yourself);
		addChild: (F4SNavItem new
				title: 'Management' seasideTranslated;
				yourself);
		addChild: (F4SNavItem new
				title: 'SAAS' seasideTranslated;
				yourself);
		addChild: (F4SNavItem new
				title: 'Support Desk' seasideTranslated;
				yourself);
		yourself
]

{ #category : #accessing }
F4SFalconDemo >> fileLibraryClass [
	^ F4SFalconDemoFileLibrary
]

{ #category : #initalization }
F4SFalconDemo >> initializeNavigation [
	super initializeNavigation.
	self
		addNavItem: self dashboardNavigation;
		addNavItem: self appNavigation;
		addNavItem: self pagesNavigation
]

{ #category : #navigation }
F4SFalconDemo >> pagesNavigation [
	^ F4SNavItem new
		title: 'Pages' seasideTranslated;
		beGroup;
		addChild: (F4SNavItem new
				title: 'Others' seasideTranslated;
				row: 1 column: 4;
				promoteChildrenInVertical: true;
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
						promoteChildrenInVertical: true;
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

{ #category : #accessing }
F4SFalconDemo >> windowTitle [
	^ 'Falcon | Dashboard & Web App Template'
]

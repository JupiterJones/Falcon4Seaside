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
				yourself);
		addChild: (F4SNavItem new
				title: 'Chat' seasideTranslated;
				icon: 'comments';
				yourself);
		addChild: (F4SNavItem new
				title: 'Email' seasideTranslated;
				icon: 'envelope-open';
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

{ #category : #initalization }
F4SFalconDemo >> initializeNavigation [
	super initializeNavigation.
	self addNavItem: self dashboardNavigation
]

{ #category : #accessing }
F4SFalconDemo >> windowTitle [
	^ 'Falcon | Dashboard & Web App Template'
]

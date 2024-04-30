Class {
	#name : #F4SRootComponent,
	#superclass : #F4SAbstractPanel,
	#category : #'Falcon4Seaside-Core'
}

{ #category : #updating }
F4SRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot meta charset: 'utf8'.
	anHtmlRoot meta
		attributeAt: 'http-equiv' put: 'X-UA-Compatible';
		content: 'IE=edge'.
	anHtmlRoot meta
		name: 'viewport';
		content: 'width=device-width, initial-scale=1'.
	anHtmlRoot title: self windowTitle.
	self updateRootFavIcon: anHtmlRoot.
	self updateRootTheme: anHtmlRoot.
]

{ #category : #updating }
F4SRootComponent >> updateRootFavIcon: anHtmlRoot [
	"Add links for all the favicon options"
	
	"Adding apple-touch-icon"
	anHtmlRoot link
		rel: 'apple-touch-icon';
		sizes: '180x180';
		url: '/files/F4SFileLibrary/images/icons/apple-touch-icon.png'.	
	
	"Adding favicon for 32x32"
	anHtmlRoot link
		rel: 'icon';
		type: 'image/png';
		sizes: '32x32';
		url: '/files/F4SFileLibrary/images/icons/favicon-32x32.png'.
	
	"Adding favicon for 16x16"
	anHtmlRoot link
		rel: 'icon';
		type: 'image/png';
		sizes: '16x16';
		url: '/files/F4SFileLibrary/images/icons/favicon-16x16.png'.
	
	"Adding web application manifest"
	anHtmlRoot link
		rel: 'manifest';
		url: '/files/F4SFileLibrary/images/icons/site.webmanifest'.	
	
	"Adding Safari mask icon"
	anHtmlRoot link
		rel: 'mask-icon';
		href: '/files/F4SFileLibrary/images/icons/safari-pinned-tab.svg';
		color: '#5bbad5'.
	
	"Adding shortcut icon"
	anHtmlRoot link
		rel: 'shortcut icon';
		href: '/files/F4SFileLibrary/images/icons/favicon.ico'.
	
	"Adding meta tags for application titles and configuration"
	anHtmlRoot meta
		name: 'apple-mobile-web-app-title';
		content: self windowTitle.
	anHtmlRoot meta
		name: 'application-name';
		content: self windowTitle.
	anHtmlRoot meta
		name: 'msapplication-TileColor';
		content: '#2b5797'.
	anHtmlRoot meta
		name: 'msapplication-config';
		content: '/assets/images/icons/browserconfig.xml'.
	anHtmlRoot meta
		name: 'theme-color';
		content: '#ffffff'
]

{ #category : #updating }
F4SRootComponent >> updateRootTheme: anHtmlRoot [
	"Add links for the theme"
	
	"Setting theme color"
    anHtmlRoot meta
        name: 'theme-color';
        content: '#ffffff'.

    "Adding theme config JavaScript"
    anHtmlRoot script
        url: 'assets/js/config.js'.
	
]

{ #category : #accessing }
F4SRootComponent >> windowTitle [
	^ self subclassResponsibility
]

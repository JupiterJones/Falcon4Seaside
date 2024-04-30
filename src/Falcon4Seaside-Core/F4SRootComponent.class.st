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
	self updateRootFavIcon: anHtmlRoot
]

{ #category : #updating }
F4SRootComponent >> updateRootFavIcon: anHtmlRoot [ 

    "Adding apple-touch-icon"
    anHtmlRoot link
        rel: 'apple-touch-icon';
        sizes: '180x180';
        url: 'files/F4SFileLibrary/img/favicons/apple-touch-icon.png'.

    "Adding favicon for 32x32"
    anHtmlRoot link
        rel: 'icon';
        type: 'image/png';
        sizes: '32x32';
        url: 'files/F4SFileLibrary/img/favicons/favicon-32x32.png'.

    "Adding favicon for 16x16"
    anHtmlRoot link
        rel: 'icon';
        type: 'image/png';
        sizes: '16x16';
        url: 'files/F4SFileLibrary/img/favicons/favicon-16x16.png'.

    "Adding shortcut icon"
    anHtmlRoot link
        rel: 'shortcut icon';
        type: 'image/x-icon';
        url: 'files/F4SFileLibrary/img/favicons/favicon.ico'.

    "Adding manifest"
    anHtmlRoot link
        rel: 'manifest';
        url: 'files/F4SFileLibrary/img/favicons/manifest.json'.

    "Adding meta tags for Microsoft application"
    anHtmlRoot meta
        name: 'msapplication-TileImage';
        content: 'files/F4SFileLibrary/img/favicons/mstile-150x150.png'.
]

{ #category : #accessing }
F4SRootComponent >> windowTitle [
	^ self subclassResponsibility
]

Class {
	#name : #F4SRootComponent,
	#superclass : #F4SAbstractPanel,
	#category : #'Falcon4Seaside-Core'
}

{ #category : #accesing }
F4SRootComponent >> currentLanguage [
	^ 'en-US'
]

{ #category : #accessing }
F4SRootComponent >> currentTheme [
	^ 'light'
]

{ #category : #accessing }
F4SRootComponent >> leftToRightOrRightToLeft [
	"Answer ltr to rtl"
	^ 'ltr'
]

{ #category : #updating }
F4SRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot htmlAttributes
		at: 'lang' append: self currentLanguage;
		at: 'data-bs-theme' append: self currentTheme;
		at: 'dir' append: self leftToRightOrRightToLeft.

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
	self updateRootScripts: anHtmlRoot.
	self updateRootStyles: anHtmlRoot
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
F4SRootComponent >> updateRootScripts: anHtmlRoot [ 
	"Add scripts that will be loaded on every page"
	
	"Adding external JavaScript file for SimpleBar"
    anHtmlRoot script
        url: 'vendors/simplebar/simplebar.min.js'.
]

{ #category : #updating }
F4SRootComponent >> updateRootStyles: anHtmlRoot [ 
	"Add stylesheets"

    "Preconnect to fonts.gstatic.com"
    anHtmlRoot link
        rel: 'preconnect';
        href: 'https://fonts.gstatic.com'.

    "Adding Google Fonts stylesheet for Open Sans and Poppins"
    anHtmlRoot link
        href: 'https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&display=swap';
        rel: 'stylesheet'.

    "Adding SimpleBar CSS"
    anHtmlRoot link
        href: '/files/F4SFileLibrary/vendors/simplebar/simplebar.min.css';
        rel: 'stylesheet'.

    "Adding right-to-left theme stylesheet"
    anHtmlRoot link
        href: '/files/F4SFileLibrary/css/theme-rtl.css';
        rel: 'stylesheet';
        id: 'style-rtl'.

    "Adding default theme stylesheet"
    anHtmlRoot link
        href: '/files/F4SFileLibrary/css/theme.css';
        rel: 'stylesheet';
        id: 'style-default'.

    "Adding user-specific right-to-left stylesheet"
    anHtmlRoot link
        href: '/files/F4SFileLibrary/css/user-rtl.css';
        rel: 'stylesheet';
        id: 'user-style-rtl'.

    "Adding user-specific default stylesheet"
    anHtmlRoot link
        href: '/files/F4SFileLibrary/css/user.css';
        rel: 'stylesheet';
        id: 'user-style-default'.

	 anHtmlRoot addScript: '
        var isRTL = JSON.parse(localStorage.getItem("isRTL"));
        if (isRTL) {
            var linkDefault = document.getElementById("style-default");
            var userLinkDefault = document.getElementById("user-style-default");
            linkDefault.setAttribute("disabled", true);
            userLinkDefault.setAttribute("disabled", true);
            document.querySelector("html").setAttribute("dir", "rtl");
        } else {
            var linkRTL = document.getElementById("style-rtl");
            var userLinkRTL = document.getElementById("user-style-rtl");
            linkRTL.setAttribute("disabled", true);
            userLinkRTL.setAttribute("disabled", true);
        }'.
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

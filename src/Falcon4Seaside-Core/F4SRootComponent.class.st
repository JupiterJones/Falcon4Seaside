Class {
	#name : #F4SRootComponent,
	#superclass : #F4SAbstractPanel,
	#category : #'Falcon4Seaside-Core'
}

{ #category : #installing }
F4SRootComponent class >> applicationName [
	^ self subclassResponsibility
]

{ #category : #accessing }
F4SRootComponent class >> canBeRoot [
	^ true
]

{ #category : #installing }
F4SRootComponent class >> configureApplication: anApplication [
	anApplication preferenceAt: #sessionClass put: F4SSession.
	anApplication configuration addParent: F4SSystemConfiguration instance.
]

{ #category : #installing }
F4SRootComponent class >> register [
	self configureApplication: (WAAdmin register: self asApplicationAt: self applicationName)
]

{ #category : #installing }
F4SRootComponent class >> reregister [
	self
		unregister;
		register
]

{ #category : #installing }
F4SRootComponent class >> unregister [
	WAAdmin unregister: self applicationName
]

{ #category : #accesing }
F4SRootComponent >> currentLanguage [
	^ 'en-US'
]

{ #category : #accessing }
F4SRootComponent >> currentTheme [
	^ 'light'
]

{ #category : #accessing }
F4SRootComponent >> fileLibraryClass [
	^ F4SFileLibrary
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
	anHtmlRoot meta
		attributeAt: 'http-equiv' put: 'X-UA-Compatible';
		content: 'IE=edge'.
	anHtmlRoot meta
		name: 'viewport';
		content: 'width=device-width, initial-scale=1'.
	anHtmlRoot title: self windowTitle asUTF8Bytes.
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
		relationship: 'apple-touch-icon';
		attributeAt: 'sizes' put: '180x180';
		url: self fileLibraryClass / #'imagesfaviconappletouchiconPng'.	
	
	"Adding favicon for 32x32"
	anHtmlRoot link
		relationship: 'icon';
		type: 'image/png';
		attributeAt: 'sizes' put: '32x32';
		url: self fileLibraryClass / #'imagesfaviconfavicon32x32Png'.
	
	"Adding favicon for 16x16"
	anHtmlRoot link
		relationship: 'icon';
		type: 'image/png';
		attributeAt: 'sizes' put: '16x16';
		url: self fileLibraryClass / #'imagesfaviconfavicon16x16Png'.
	
	"Adding web application manifest"
	anHtmlRoot link
		relationship: 'manifest';
		url: self fileLibraryClass / #'imagesfaviconsiteWebmanifest'.	
	
	"Adding Safari mask icon"
	anHtmlRoot link
		relationship: 'mask-icon';
		url: self fileLibraryClass / #'imagesfaviconsafaripinnedtabSvg';
		attributeAt: 'color' put: '#5bbad5'.
	
	"Adding shortcut icon"
	anHtmlRoot link
		relationship: 'shortcut icon';
		url: self fileLibraryClass / #'imagesfaviconfaviconIco'.
	
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
		content: self fileLibraryClass / #'imagesfaviconbrowserconfigXml'.
]

{ #category : #updating }
F4SRootComponent >> updateRootScripts: anHtmlRoot [ 
	"Add scripts that will be loaded on every page"
	
	"Adding external JavaScript file for SimpleBar"
    anHtmlRoot script
        url: self fileLibraryClass / #'vendorssimplebarsimplebarminJs'.
]

{ #category : #updating }
F4SRootComponent >> updateRootStyles: anHtmlRoot [ 
	"Add stylesheets"

    "Preconnect to fonts.gstatic.com"
    anHtmlRoot link
        relationship: 'preconnect';
        url: 'https://fonts.gstatic.com'.

    "Adding Google Fonts stylesheet for Open Sans and Poppins"
    anHtmlRoot link
    	relationship: 'stylesheet';
        url: 'https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&display=swap'.
       
    "Adding SimpleBar CSS"
    anHtmlRoot link
    	relationship: 'stylesheet';
        url: self fileLibraryClass / #'vendorssimplebarsimplebarminCss'.

    "Adding right-to-left theme stylesheet"
    anHtmlRoot link
    	relationship: 'stylesheet';
        url: self fileLibraryClass / #'cssthemertlCss';
        attributeAt: 'id' put: 'style-rtl'.

    "Adding default theme stylesheet"
    anHtmlRoot link
    	relationship: 'stylesheet';
        url: self fileLibraryClass / #'cssthemeCss';
        attributeAt: 'id' put: 'style-default'.

    "Adding user-specific right-to-left stylesheet"
    anHtmlRoot link
    	relationship: 'stylesheet';
        url: self fileLibraryClass / #'cssuserrtlCss';
        attributeAt: 'id' put: 'user-style-rtl'.

    "Adding user-specific default stylesheet"
    anHtmlRoot link
    	relationship: 'stylesheet';
        url: self fileLibraryClass / #'cssuserCss';
        attributeAt: 'id' put: 'user-style-default'.

	 anHtmlRoot script with: '
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
        url: self fileLibraryClass / #'jsconfigJs'.
]

{ #category : #accessing }
F4SRootComponent >> windowTitle [
	^ self subclassResponsibility
]

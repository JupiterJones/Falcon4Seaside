Class {
	#name : #F4SRootComponent,
	#superclass : #F4SCompositeComponent,
	#instVars : [
		'navigationItems'
	],
	#category : #'Falcon4Seaside-Core'
}

{ #category : #accessing }
F4SRootComponent class >> applicationName [
	^ self subclassResponsibility
]

{ #category : #'seaside-hooks' }
F4SRootComponent class >> canBeRoot [
	^ true
]

{ #category : #'seaside-hooks' }
F4SRootComponent class >> configureApplication: anApplication [
	anApplication preferenceAt: #sessionClass put: F4SSession.
	anApplication configuration
		addParent: WAGetTextConfiguration instance;
		addParent: F4SSystemConfiguration instance.
	anApplication
		addLibrary: self fileLibraryClass;
		addLibrary: JQDevelopmentLibrary.
	anApplication preferenceAt: #gettextApplicationName put: self applicationName.
	anApplication
		preferenceAt: #pathToRepository
		put: '/opt/git/JupiterJones/Falcon4Seaside'
]

{ #category : #accessing }
F4SRootComponent class >> currentLanguage [
	^ 'en-US'
]

{ #category : #accessing }
F4SRootComponent class >> currentTheme [
	^ 'light'
]

{ #category : #accessing }
F4SRootComponent class >> fileLibraryClass [
	^ F4SFileLibrary
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

{ #category : #accessing }
F4SRootComponent class >> windowTitle [
	^ self subclassResponsibility
]

{ #category : #accessing }
F4SRootComponent >> applicationName [
	^ self class applicationName
]

{ #category : #scripts }
F4SRootComponent >> configJs [
	| stream |
	stream := JSStream new.
	stream
		nextPutAll: '"use strict";

/* -------------------------------------------------------------------------- */
/*                              Config                                        */
/* -------------------------------------------------------------------------- */
var CONFIG = { '.

	stream
		nextPutAll: 'isNavbarVerticalCollapsed: ';
		nextPutAll: (self application configuration at: #isNavbarVerticalCollapsed) asString;
		nextPutAll: ', '.
	stream
		nextPutAll: 'theme: "';
		nextPutAll: (self application configuration at: #theme);
		nextPutAll: '", '.
	stream
		nextPutAll: 'isRTL: ';
		nextPutAll: (self application configuration at: #isRTL) asString;
		nextPutAll: ', '.
	stream
		nextPutAll: 'isFluid: ';
		nextPutAll: (self application configuration at: #isFluid) asString;
		nextPutAll: ', '.
	stream
		nextPutAll: 'navbarStyle: "';
		nextPutAll: (self application configuration at: #navbarStyle);
		nextPutAll: '", '.
	stream
		nextPutAll: 'navbarPosition: "';
		nextPutAll: (self application configuration at: #navbarPosition);
		nextPutAll: '"'.


	stream
		nextPutAll: '}; 
Object.keys(CONFIG).forEach(function (key) {
  if (localStorage.getItem(key) === null) {
    localStorage.setItem(key, CONFIG[key]);
  }
});
if (JSON.parse(localStorage.getItem("isNavbarVerticalCollapsed"))) {
  document.documentElement.classList.add("navbar-vertical-collapsed");
}
if (localStorage.getItem("theme") === "dark") {
  document.documentElement.setAttribute("data-bs-theme", "dark");
} else if (localStorage.getItem("theme") === "auto") {
  document.documentElement.setAttribute("data-bs-theme", window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light");
}'.
^ stream
]

{ #category : #access }
F4SRootComponent >> containerClass [
	"Answers 'container' or 'container-fluid'"

	^ String
		streamContents: [ :stream | 
			stream nextPutAll: 'container'.
			(self application configuration at: #isFluid)
				ifTrue: [ stream nextPutAll: '-fluid' ] ]
]

{ #category : #accessing }
F4SRootComponent >> currentLanguage [
	^ 'en_AU'
]

{ #category : #accessing }
F4SRootComponent >> currentTheme [
	^ 'light'
]

{ #category : #accessing }
F4SRootComponent >> fileLibraryClass [
	^ self class fileLibraryClass
]

{ #category : #initialization }
F4SRootComponent >> initialComponent [
	^ self subclassResponsibility
]

{ #category : #initialization }
F4SRootComponent >> initialize [
	super initialize.
	self initializeNavigation.
	announcer announce: (F4SComponentSelected component: self initialComponent).
]

{ #category : #initialization }
F4SRootComponent >> initializeNavigation [
	navigationItems := OrderedCollection new.
	self
		componentAt: #navigation
		ifAbsentPut: [ F4SNavigationComponent new
				navigation: navigationItems;
				yourself ]
]

{ #category : #initialization }
F4SRootComponent >> initializeNavigationItems [
	
]

{ #category : #accessing }
F4SRootComponent >> leftToRightOrRightToLeft [
	^ (self application configuration at: #isRTL)
		ifTrue: [ 'rtl' ]
		ifFalse: [ 'ltr' ]
]

{ #category : #accessing }
F4SRootComponent >> navigationComponent [
	^ self componentAt: #navigation
]

{ #category : #rendering }
F4SRootComponent >> renderBodyContentOn: canvas [
	canvas div
		class: 'content';
		with: [ self renderNavigationBodyContentOn: canvas.
			canvas render: self selectedComponent ]
]

{ #category : #rendering }
F4SRootComponent >> renderContentOn: canvas [
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
F4SRootComponent >> renderEndOfBodyScriptsOn: canvas [
	canvas script url: F4SFileLibrary / #vendorspopperpopperminJs.
	canvas script url: F4SFileLibrary / #vendorsbootstrapbootstrapminJs.
	canvas script url: F4SFileLibrary / #vendorsanchorjsanchorminJs.
	canvas script url: F4SFileLibrary / #vendorsisisminJs.
	canvas script url: F4SFileLibrary / #vendorsechartsechartsminJs.
	canvas script url: F4SFileLibrary / #vendorsprismprismJs.
	canvas script url: F4SFileLibrary / #vendorsfontawesomeallminJs.
	canvas script url: F4SFileLibrary / #vendorslodashlodashminJs.
	canvas script
		url: 'https://polyfill.io/v3/polyfill.min.js?features=window.scroll'.
	canvas script url: F4SFileLibrary / #vendorslistjslistminJs.
	canvas script url: F4SFileLibrary / #jsthemeJs
]

{ #category : #rendering }
F4SRootComponent >> renderNavigationBodyContentOn: canvas [
	self navigationComponent renderNavigationBodyContentOn: canvas
]

{ #category : #rendering }
F4SRootComponent >> renderNavigationOn: canvas [ 
	"canvas render: self navigationComponent"
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
	anHtmlRoot title: self windowTitle seasideTranslated asUTF8Bytes.
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

	"Prism Dark Theme"
	anHtmlRoot link 
		relationship: 'stylesheet';
		url: self fileLibraryClass / #'vendorsprismprismokaidiaCss'.
		
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
    anHtmlRoot script with: self configJs
]

{ #category : #accessing }
F4SRootComponent >> windowTitle [
	^ self class windowTitle
]

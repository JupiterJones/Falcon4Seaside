Class {
	#name : #F4SSystemConfiguration,
	#superclass : #WASystemConfiguration,
	#category : #'Falcon4Seaside-Core'
}

{ #category : #accessing }
F4SSystemConfiguration >> describeOn: config [
	(config boolean: #isNavbarVerticalCollapsed)
		comment: 'Will the vertical nav bar be displayed as "collapsed" when rendered.';
		group: #FalconConfig;
		default: true.
	(config string: #theme)
		comment: 'What theme is to be used when the page loads.';
		group: #FalconConfig;
		options: #('light' 'dark' 'auto');
		default: 'auto'.
	(config boolean: #isRTL)
		comment: 'Will the page be rendered Right to Left?';
		group: #FalconConfig;
		default: false.
	(config boolean: #isFluid)
		comment: 'Will the page use a fluid layout';
		group: #FalconConfig;
		default: false.
	(config string: #navbarStyle)
		comment: 'Which navbar style will be used.';
		group: #FalconConfig;
		options: #('standard' 'card' 'inverted' 'vibrant' 'transparent');
		default: 'standard'.
	(config string: #navbarPosition)
		comment: 'Where will the navbar be displayed.';
		group: #FalconConfig;
		options: #('vertical' 'top' 'double-top');
		default: 'vertical'.

]

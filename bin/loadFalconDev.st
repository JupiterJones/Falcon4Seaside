Metacello new
 baseline:'Seaside3';
 repository: 'github://SeasideSt/Seaside:master/repository';
 load: #('CI' 'Zinc' 'Development').

Metacello new
	repository: 'filetree:///opt/git/JupiterJones/Falcon4Seaside/src';
	baseline: 'Falcon4Seaside';
	load.
	
#BaselineOfFalcon4Seaside asClass loadLepiter.

Metacello new
	repository: 'filetree:///opt/git/JupiterJones/JupiterWeb/src';
	baseline: 'JupiterWeb';
	load.

Metacello new
	repository: 'filetree:///opt/git/fios-systems/FIOSWeb/src';
	baseline: 'FIOSWeb';
	load.

Metacello new
	repository: 'filetree:///opt/git/BenjaVisionPro/CatalystWeb/src';
	baseline: 'CatalystWeb';
	load.

Metacello new
	repository: 'filetree:///opt/git/Benjability/BenjabilityWeb/src';
	baseline: 'BenjabilityWeb';
	load.

Metacello new
	repository: 'github://feenkcom/gt4llm:main/src';
	baseline: 'Gt4Llm';
	load.

Metacello new
	repository: 'github://feenkcom/gt4llm:main/src';
	baseline: 'Gt4OpenAI';
	load.

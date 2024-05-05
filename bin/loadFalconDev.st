"Load projects"
Metacello new
 baseline:'Seaside3';
 repository: 'gitlocal:///opt/git/JupiterSmalltalk/Seaside/repository';
 load: #('CI' 'Zinc' 'Development').

Metacello new
	repository: 'gitlocal:///opt/git/JupiterJones/Falcon4Seaside/src';
	baseline: 'Falcon4Seaside';
	load.
	
Metacello new
	repository: 'gitlocal:///opt/git/JupiterJones/JupiterWeb/src';
	baseline: 'JupiterWeb';
	load.

Metacello new
	repository: 'gitlocal:///opt/git/fios-systems/FIOSWeb/src';
	baseline: 'FIOSWeb';
	load.

Metacello new
	repository: 'gitlocal:///opt/git/BenjaVision/CatalystWeb/src';
	baseline: 'CatalystWeb';
	load.

Metacello new
	repository: 'gitlocal:///opt/git/Benjability/BenjabilityWeb/src';
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

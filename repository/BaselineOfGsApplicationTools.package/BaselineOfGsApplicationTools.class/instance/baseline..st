baseline
baseline: spec
  <baseline>
  spec
    for: #'gemstone'
    do: [ 
      spec
        baseline: 'GLASS1'
          with: [ 
              spec
                loads: #('Base');
                repository: 'github://glassdb/glass:master/repository' ];
        yourself.
      spec
        package: 'GsApplicationTools-Server';
        package: 'GsApplicationTools-Test'
          with: [ spec requires: #('GsApplicationTools-Server') ];
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core' with: #('GsApplicationTools-Server');
        group: 'Tests' with: #('GsApplicationTools-Test');
        group: 'CI' with: #('Tests');
        yourself ].
  spec
    for: #'gs2.4.x'
    do: [ 
      spec
        package: 'GsApplicationTools-Server'
          with: [ spec includes: 'GsApplicationTools-ServerV24' ];
        package: 'GsApplicationTools-ServerV24'
          with: [ spec requires: 'GsApplicationTools-Server' ];
        yourself ].
  spec
    for: #'gs3.x'
    do: [ 
      spec
        package: 'GsApplicationTools-Server'
          with: [ spec includes: 'GsApplicationTools-ServerV30' ];
        package: 'GsApplicationTools-ServerV30'
          with: [ spec requires: 'GsApplicationTools-Server' ];
        yourself ]
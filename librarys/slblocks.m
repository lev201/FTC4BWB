
blkStruct.OpenFcn = {'CA_library','BWB_library', 'SMC', 'FDI', 'Actuators'}; 

Browser(1).Library = 'CA_library'; 

Browser(1).Name    = 'Control Allocation Toolbox'; 


Browser(2).Library = 'BWB_library'; 

Browser(2).Name    = 'Blended Wing Body Aircraft'; 

Browser(3).Library = 'SMC'; 

Browser(3).Name    = 'Sliding Mode Control Toolbox'; 

Browser(4).Library = 'FDI'; 

Browser(4).Name    = 'Fault Detection & Isolation Toolbox'; 

Browser(5).Library = 'Actuators'; 

Browser(5).Name    = 'Actuators'; 

blkStruct.Browser = Browser; 
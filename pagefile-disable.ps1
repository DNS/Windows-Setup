wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=0,MaximumSize=0
wmic pagefileset where name="C:\\pagefile.sys" delete



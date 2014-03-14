[cmdletbinding()]
param($installPath, $toolsPath, $package, $project)

if($project.Type -ne 'Web Site') { return }

$name = "NSass.Wrapper"
$binPath = $project.ProjectItems.Item('bin').Properties.Item('FullPath').Value
# Wildcard trick to repress errors in case the project was never built
#	http://stackoverflow.com/a/4364807/95195
Remove-Item (Join-Path $binPath ($name + ".[x]86.dll"))
Remove-Item (Join-Path $binPath ($name + ".[x]64.dll"))
Remove-Item (Join-Path $binPath ($name + ".x86.dll.refresh"))
Remove-Item (Join-Path $binPath ($name + ".x64.dll.refresh"))
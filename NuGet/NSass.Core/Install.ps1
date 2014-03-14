[cmdletbinding()]
param($installPath, $toolsPath, $package, $project)


$name = "NSass.Wrapper"

$x86 = $project.ProjectItems.Item($name).ProjectItems.Item($name + ".x86.dll")
$x64 = $project.ProjectItems.Item($name).ProjectItems.Item($name + ".x64.dll")

if ($project.Type -eq 'Web Site'){
	$binPath = $project.ProjectItems.Item('bin').Properties.Item('FullPath').Value
	$sitePath = $project.Properties.Item('FullPath').Value
	$oldPath = (Get-Location).Path
	Set-Location $sitePath
	$contentPath = Join-Path $installPath 'content\NSass.Wrapper' | Resolve-Path -Relative
	Set-Location $oldPath
#	Remove-Item $x86.Properties.Item('FullPath').Value
#	Remove-Item $x64.Properties.Item('FullPath').Value
	Set-Content (Join-Path $binPath ($name + ".x86.dll.refresh")) (Join-Path $contentPath ($name + ".x86.dll")) 
	Set-Content (Join-Path $binPath ($name + ".x64.dll.refresh")) (Join-Path $contentPath ($name + ".x64.dll")) 
	Set-Location $oldPath
}
else {
	$x86.Properties.Item("CopyToOutputDirectory").Value = 2;
	$x64.Properties.Item("CopyToOutputDirectory").Value = 2;
}
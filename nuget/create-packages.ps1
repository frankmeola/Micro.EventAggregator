function Get-ScriptDirectory {
  $Invoc = (Get-Variable MyInvocation -Scope 1).Value
  Split-Path $Invoc.MyCommand.Path 
}

# Hang on to current location
pushd . 

# Move to the Package working directory
$pkgroot = (Get-ScriptDirectory) + "\package"
cd $pkgroot

copy ..\..\EventAggregator.cs .\content

..\nuget.exe pack micro.eventaggregator.nuspec

popd
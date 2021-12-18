$solutionSource = "src/solutions/$solutionName"
Write-Output 'build plugin'
$pluginBuildPath = $solutionSource + '/plugins/' + $solutionName + '.plugins'
dotnet build $pluginBuildPath -c release
$currentDirectory = Get-Location
$pcfPath = "$solutionSource/pcf-components"
Set-Location "$solutionSource/pcf-components/DynamicTextInput
Write-Output 'build pcf'
npm install          
dotnet build -c release
Set-Location $currentDirectory
Write-Output 'copy build artifacts into solution folders'
$builtPluginDLL = "$pluginBuildPath/bin/Release/net462/pacmaptest.plugins.dll"
$solutionPluginDLL = "$solutionSource\unpacked-solution\PluginAssemblies\pacmaptestplugins-D17FD708-BAF5-4441-8261-0099CC098DE7\pacmaptestplugins.dll"
Copy-Item $builtPluginDLL $solutionPluginDLL

$pcfBuildOutput = "$pluginBuildPath/bin/Release/net462/pacmaptest.plugins.dll"
$solutionPluginDLL = "$solutionSource\unpacked-solution\PluginAssemblies\pacmaptestplugins-D17FD708-BAF5-4441-8261-0099CC098DE7\pacmaptestplugins.dll"
Copy-Item $builtPluginDLL $solutionPluginDLL
function ExportUnpack ($solutionName, $exportDirectory) {
    pac solution publish
    $unmanaged = "$exportDirectory/$solutionName.zip"
    del $unmanaged
    $managed = "$exportDirectory/$solutionName" + "_managed.zip"
    del $managed
    pac solution export --path $unmanaged --name $solutionName --managed false
    pac solution export --path $managed --name $solutionName --managed true
    pac solution unpack -f src/solutions/$solutionName/unpacked-solution -z $unmanaged -p both --allowDelete true
}
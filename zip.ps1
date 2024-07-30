param(
    [string]$source_path,
    [string]$plugin_name,
    [string]$exclude
)

$sourcePath = $source_path
$destinationPath = Join-Path $sourcePath ($plugin_name + '.zip')

# Convert the exclude parameter into an array
$excludePatterns = $exclude -split ';' | Where-Object { $_ -ne '' }

# Define the function to create the zip file
Add-Type -AssemblyName 'System.IO.Compression.FileSystem'
function Add-Zip {
    param(
        [string]$sourcePath,
        [string]$destinationPath,
        [string[]]$excludePatterns,
        [string]$containerFolder
    )
    
    # Remove existing zip file if it exists
    if (Test-Path -Path $destinationPath) {
        Remove-Item -Path $destinationPath
    }

    # Create a temporary directory
    $tempDir = [System.IO.Path]::GetTempPath()
    $tempCopyPath = Join-Path $tempDir ([System.IO.Path]::GetRandomFileName())
    $containerPath = Join-Path $tempCopyPath $containerFolder

    # Create the container folder
    New-Item -ItemType Directory -Path $containerPath | Out-Null

    # Copy source directory to the container folder
    Copy-Item -Path (Join-Path $sourcePath '*') -Destination $containerPath -Recurse -Force

    # Exclude directories and files
    foreach ($pattern in $excludePatterns) {
        # Exclude directories
        Get-ChildItem -Path $containerPath -Recurse -Directory | Where-Object { $_.FullName -like "*$pattern*" } | Remove-Item -Recurse -Force

        # Exclude files
        Get-ChildItem -Path $containerPath -Recurse -File | Where-Object { $_.Name -like "*$pattern*" } | Remove-Item -Force
    }

    # Create the zip file from the temporary directory
    [System.IO.Compression.ZipFile]::CreateFromDirectory($tempCopyPath, $destinationPath)

    # Clean up the temporary directory
    Remove-Item -Path $tempCopyPath -Recurse -Force

    # Output success message
    Write-Output 'Zip file created successfully at ' $destinationPath
}

# Call the function with defined variables
Add-Zip -sourcePath $sourcePath -destinationPath $destinationPath -excludePatterns $excludePatterns -containerFolder $plugin_name

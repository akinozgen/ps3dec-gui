Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Select-FileDialog {
    param (
        [string]$Filter = "All files (*.*)|*.*"
    )
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.Filter = $Filter
    $OpenFileDialog.ShowDialog() | Out-Null
    return $OpenFileDialog.FileName
}

function Select-FolderDialog {
    $FolderBrowserDialog = New-Object System.Windows.Forms.FolderBrowserDialog
    $FolderBrowserDialog.ShowDialog() | Out-Null
    return $FolderBrowserDialog.SelectedPath
}

function Show-MessageBox {
    param (
        [string]$Message,
        [string]$Title = "Information"
    )
    [System.Windows.Forms.MessageBox]::Show($Message, $Title, [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
}

function Log-Error {
    param (
        [string]$Message
    )
    $errorLogFile = "error_log.txt"
    Add-Content -Path $errorLogFile -Value $Message
}

$form = New-Object System.Windows.Forms.Form
$form.Text = "PS3 Game Decryptor"
$form.Size = New-Object System.Drawing.Size(450,550)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false
$form.MinimizeBox = $false

# Function to load settings from a file
function Load-Settings {
    $settingsFile = "settings.txt"
    if (Test-Path $settingsFile) {
        $settings = Get-Content $settingsFile | ConvertFrom-Json
        $txtExtractLocation.Text = $settings.ExtractLocation
        $txt7zPath.Text = $settings.SevenZPath
        $txtPS3DecPath.Text = $settings.PS3DecPath
    } else {
        # Set default values if settings file does not exist
        $txtExtractLocation.Text = "D:\Lab\Emulation\PS3\GAMES"
        $txt7zPath.Text = "C:\Program Files\7-Zip\7z.exe"
        $txtPS3DecPath.Text = "D:\Lab\Emulation\PS3\ISO\ps3dec.exe"
    }
}

# Function to save settings to a file
function Save-Settings {
    $settingsFile = "settings.txt"
    $settings = @{
        ExtractLocation = $txtExtractLocation.Text
        SevenZPath = $txt7zPath.Text
        PS3DecPath = $txtPS3DecPath.Text
    }
    $settings | ConvertTo-Json | Set-Content -Path $settingsFile
}

$btnSelectISO = New-Object System.Windows.Forms.Button
$btnSelectISO.Text = "Select ISO"
$btnSelectISO.Location = New-Object System.Drawing.Point(10,20)
$btnSelectISO.Size = New-Object System.Drawing.Size(80,30)
$form.Controls.Add($btnSelectISO)

$txtISO = New-Object System.Windows.Forms.TextBox
$txtISO.Location = New-Object System.Drawing.Point(100,25)
$txtISO.Size = New-Object System.Drawing.Size(250,20)
$form.Controls.Add($txtISO)

$btnSelectDKey = New-Object System.Windows.Forms.Button
$btnSelectDKey.Text = "Select DKey"
$btnSelectDKey.Location = New-Object System.Drawing.Point(10,70)
$btnSelectDKey.Size = New-Object System.Drawing.Size(80,30)
$form.Controls.Add($btnSelectDKey)

$txtDKey = New-Object System.Windows.Forms.TextBox
$txtDKey.Location = New-Object System.Drawing.Point(100,75)
$txtDKey.Size = New-Object System.Drawing.Size(250,20)
$form.Controls.Add($txtDKey)

$lblExtractLocation = New-Object System.Windows.Forms.Label
$lblExtractLocation.Text = "Extract Location:"
$lblExtractLocation.Location = New-Object System.Drawing.Point(10,120)
$lblExtractLocation.Size = New-Object System.Drawing.Size(100,20)
$form.Controls.Add($lblExtractLocation)

$txtExtractLocation = New-Object System.Windows.Forms.TextBox
$txtExtractLocation.Location = New-Object System.Drawing.Point(10,145)
$txtExtractLocation.Size = New-Object System.Drawing.Size(320,20)
$form.Controls.Add($txtExtractLocation)

$btnSelectExtractLocation = New-Object System.Windows.Forms.Button
$btnSelectExtractLocation.Text = "..."
$btnSelectExtractLocation.Location = New-Object System.Drawing.Point(340,145)
$btnSelectExtractLocation.Size = New-Object System.Drawing.Size(30,20)
$form.Controls.Add($btnSelectExtractLocation)

$lbl7zPath = New-Object System.Windows.Forms.Label
$lbl7zPath.Text = "7z.exe Location:"
$lbl7zPath.Location = New-Object System.Drawing.Point(10,180)
$lbl7zPath.Size = New-Object System.Drawing.Size(100,20)
$form.Controls.Add($lbl7zPath)

$txt7zPath = New-Object System.Windows.Forms.TextBox
$txt7zPath.Location = New-Object System.Drawing.Point(10,205)
$txt7zPath.Size = New-Object System.Drawing.Size(320,20)
$form.Controls.Add($txt7zPath)

$btnSelect7zPath = New-Object System.Windows.Forms.Button
$btnSelect7zPath.Text = "..."
$btnSelect7zPath.Location = New-Object System.Drawing.Point(340,205)
$btnSelect7zPath.Size = New-Object System.Drawing.Size(30,20)
$form.Controls.Add($btnSelect7zPath)

$lblPS3DecPath = New-Object System.Windows.Forms.Label
$lblPS3DecPath.Text = "ps3dec.exe Location:"
$lblPS3DecPath.Location = New-Object System.Drawing.Point(10,240)
$lblPS3DecPath.Size = New-Object System.Drawing.Size(120,20)
$form.Controls.Add($lblPS3DecPath)

$txtPS3DecPath = New-Object System.Windows.Forms.TextBox
$txtPS3DecPath.Location = New-Object System.Drawing.Point(10,265)
$txtPS3DecPath.Size = New-Object System.Drawing.Size(320,20)
$form.Controls.Add($txtPS3DecPath)

$btnSelectPS3DecPath = New-Object System.Windows.Forms.Button
$btnSelectPS3DecPath.Text = "..."
$btnSelectPS3DecPath.Location = New-Object System.Drawing.Point(340,265)
$btnSelectPS3DecPath.Size = New-Object System.Drawing.Size(30,20)
$form.Controls.Add($btnSelectPS3DecPath)

$btnDecrypt = New-Object System.Windows.Forms.Button
$btnDecrypt.Text = "Decrypt and Extract"
$btnDecrypt.Location = New-Object System.Drawing.Point(10,300)
$btnDecrypt.Size = New-Object System.Drawing.Size(120,30)
$form.Controls.Add($btnDecrypt)

$btnFindDKey = New-Object System.Windows.Forms.Button
$btnFindDKey.Text = "DKEY Index"
$btnFindDKey.Location = New-Object System.Drawing.Point(320,300)
$btnFindDKey.Size = New-Object System.Drawing.Size(100,30)
$form.Controls.Add($btnFindDKey)

$btnIsoLink = New-Object System.Windows.Forms.Button
$btnIsoLink.Text = "ISO Index"
$btnIsoLink.Location = New-Object System.Drawing.Point(320,340)
$btnIsoLink.Size = New-Object System.Drawing.Size(100,30)
$form.Controls.Add($btnIsoLink)

$btnAbout = New-Object System.Windows.Forms.Button
$btnAbout.Text = "About"
$btnAbout.Location = New-Object System.Drawing.Point(320,410)
$btnAbout.Size = New-Object System.Drawing.Size(100,30)
$form.Controls.Add($btnAbout)

$btnSelectISO.Add_Click({
    $txtISO.Text = Select-FileDialog -Filter "ISO files (*.iso)|*.iso"
})

$btnSelectDKey.Add_Click({
    $txtDKey.Text = Select-FileDialog -Filter "DKey files (*.dkey)|*.dkey"
})

$btnSelectExtractLocation.Add_Click({
    $txtExtractLocation.Text = Select-FolderDialog
})

$btnSelect7zPath.Add_Click({
    $txt7zPath.Text = Select-FileDialog -Filter "7z.exe (7z.exe)|7z.exe"
})

$btnSelectPS3DecPath.Add_Click({
    $txtPS3DecPath.Text = Select-FileDialog -Filter "ps3dec.exe (ps3dec.exe)|ps3dec.exe"
})

$btnFindDKey.Add_Click({
    Start-Process "https://myrient.erista.me/files/Redump/Sony%20-%20PlayStation%203%20-%20Disc%20Keys%20TXT/" # Replace with the actual URL
})

$btnIsoLink.Add_Click({
    Start-Process "https://myrient.erista.me/files/Redump/Sony%20-%20PlayStation%203/" # Replace with the actual URL
})

$btnDecrypt.Add_Click({
    try {
        $isoPath = $txtISO.Text
        $dkeyPath = $txtDKey.Text
        $extractLocation = $txtExtractLocation.Text
        $ps3DecPath = $txtPS3DecPath.Text
        $sevenZPath = $txt7zPath.Text
        if ([string]::IsNullOrWhiteSpace($isoPath) -or [string]::IsNullOrWhiteSpace($dkeyPath)) {
            Show-MessageBox -Message "Please select both ISO and DKey files."
            return
        }
        $gameName = [System.IO.Path]::GetFileNameWithoutExtension($isoPath)
        $outputPath = "$extractLocation\$gameName"
        $decryptedISO = "$isoPath`_decrypted.iso"
        $dkey = Get-Content -Path $dkeyPath
        
        # Decrypt the ISO
        & $ps3DecPath --iso $isoPath --dk $dkey --tc 64 --skip
        
        # Create the output directory
        if (-not (Test-Path -Path $outputPath)) {
            New-Item -ItemType Directory -Path $outputPath | Out-Null
        }
        
        # Extract the decrypted ISO
        & "$sevenZPath" x "$decryptedISO" "-o$outputPath"
        
        # Delete the decrypted ISO file
        Remove-Item -Path $decryptedISO -Force
        
        # Open the extract location in a new Explorer window
        Start-Process explorer.exe $outputPath
        
        # Prompt the user to delete the original ISO and DKey files
        $result = [System.Windows.Forms.MessageBox]::Show("Do you want to delete the original ISO and DKey files?", "Delete Files", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
        if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
            Remove-Item -Path $isoPath -Force
            Remove-Item -Path $dkeyPath -Force
        }

        Show-MessageBox -Message "Decryption and extraction complete!" -Title "Success"
        Save-Settings
    } catch {
        Log-Error $_.Exception.Message
        Show-MessageBox -Message "An error occurred. Please check error_log.txt for details." -Title "Error"
    }
})

$btnAbout.Add_Click({
    $aboutMessage = @"
PS3DEX GUI

Made by Akın Özgen <akinozgen17@outlook.com>

https://github.com/akinozgen/ps3dec-gui
"@
    Show-MessageBox -Message $aboutMessage -Title "About"
})

Load-Settings

[void]$form.ShowDialog()

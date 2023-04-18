Add-Type -AssemblyName System.Windows.Forms
Import-Module .\UpdateDscConfiguration.psm1
Import-Module .\ApplyDscConfiguration.psm1

$form = New-Object System.Windows.Forms.Form
$form.Text = 'RetAdm'
$form.Size = New-Object System.Drawing.Size(270,320)
$form.StartPosition = 'CenterScreen'

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,10)
$label.Size = New-Object System.Drawing.Size(260,20)
$label.Text = "Input Computer Name:"
$form.Controls.Add($label)

$inputBox = New-Object System.Windows.Forms.TextBox
$inputBox.Location = New-Object System.Drawing.Point(10,40)
$inputBox.Size = New-Object System.Drawing.Size(230,20)
$form.Controls.Add($inputBox)

$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(10,70)
$button.Size = New-Object System.Drawing.Size(230,20)
$button.Text = 'Change name'
$button.Add_Click({
    UpdateDscConfiguration -computerName $inputBox.Text
    $richTextBox.AppendText("Change DSC config file to " + $inputBox.Text + "`r`n")
})
$form.Controls.Add($button)

$buttonApply = New-Object System.Windows.Forms.Button
$buttonApply.Location = New-Object System.Drawing.Point(10,100)
$buttonApply.Size = New-Object System.Drawing.Size(230,20)
$buttonApply.Text = 'Apply DSC'
$buttonApply.Add_Click({
    ApplyDscConfiguration -CompName $inputBox.Text
    $richTextBox.AppendText("Apply DSC confiuration on " + $inputBox.Text+ "`r`n")
})
$form.Controls.Add($buttonApply)

$richTextBox = New-Object System.Windows.Forms.RichTextBox
$richTextBox.Location = New-Object System.Drawing.Point(10, 130)
$richTextBox.Size = New-Object System.Drawing.Size(230, 130)
$richTextBox.ReadOnly = $true
$form.Controls.Add($richTextBox)

$form.ShowDialog()

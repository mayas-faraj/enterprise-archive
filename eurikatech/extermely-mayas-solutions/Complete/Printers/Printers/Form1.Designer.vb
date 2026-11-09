<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmPrinters
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.Label7 = New System.Windows.Forms.Label
        Me.Label8 = New System.Windows.Forms.Label
        Me.txPName = New System.Windows.Forms.TextBox
        Me.txPSize = New System.Windows.Forms.TextBox
        Me.txPWidth = New System.Windows.Forms.TextBox
        Me.txPHeight = New System.Windows.Forms.TextBox
        Me.Label9 = New System.Windows.Forms.Label
        Me.Label10 = New System.Windows.Forms.Label
        Me.Label1 = New System.Windows.Forms.Label
        Me.txNewHeight = New System.Windows.Forms.TextBox
        Me.txNewWidth = New System.Windows.Forms.TextBox
        Me.txScaleValue = New System.Windows.Forms.TextBox
        Me.BarScaling = New System.Windows.Forms.TrackBar
        Me.btnPrint = New System.Windows.Forms.Button
        Me.btnGetInfo = New System.Windows.Forms.Button
        CType(Me.BarScaling, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(111, 362)
        Me.Label2.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(57, 19)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "Scaling"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(111, 143)
        Me.Label3.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(79, 19)
        Me.Label3.TabIndex = 2
        Me.Label3.Text = "Paper Size"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Font = New System.Drawing.Font("Times New Roman", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.Location = New System.Drawing.Point(111, 111)
        Me.Label4.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(99, 19)
        Me.Label4.TabIndex = 3
        Me.Label4.Text = "Printer Name"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Font = New System.Drawing.Font("Times New Roman", 24.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label5.Location = New System.Drawing.Point(180, 300)
        Me.Label5.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(255, 36)
        Me.Label5.TabIndex = 4
        Me.Label5.Text = "Test Page Scaling"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Font = New System.Drawing.Font("Times New Roman", 24.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label6.Location = New System.Drawing.Point(159, 31)
        Me.Label6.Margin = New System.Windows.Forms.Padding(4, 0, 4, 0)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(300, 36)
        Me.Label6.TabIndex = 5
        Me.Label6.Text = "Current Printer Info"
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Location = New System.Drawing.Point(111, 175)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(92, 19)
        Me.Label7.TabIndex = 6
        Me.Label7.Text = "Paper Width"
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Location = New System.Drawing.Point(111, 207)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(97, 19)
        Me.Label8.TabIndex = 7
        Me.Label8.Text = "Paper Height"
        '
        'txPName
        '
        Me.txPName.Location = New System.Drawing.Point(264, 108)
        Me.txPName.Name = "txPName"
        Me.txPName.Size = New System.Drawing.Size(100, 26)
        Me.txPName.TabIndex = 8
        '
        'txPSize
        '
        Me.txPSize.Location = New System.Drawing.Point(264, 140)
        Me.txPSize.Name = "txPSize"
        Me.txPSize.Size = New System.Drawing.Size(100, 26)
        Me.txPSize.TabIndex = 9
        '
        'txPWidth
        '
        Me.txPWidth.Location = New System.Drawing.Point(264, 172)
        Me.txPWidth.Name = "txPWidth"
        Me.txPWidth.Size = New System.Drawing.Size(100, 26)
        Me.txPWidth.TabIndex = 10
        '
        'txPHeight
        '
        Me.txPHeight.Location = New System.Drawing.Point(264, 204)
        Me.txPHeight.Name = "txPHeight"
        Me.txPHeight.Size = New System.Drawing.Size(100, 26)
        Me.txPHeight.TabIndex = 11
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Location = New System.Drawing.Point(111, 416)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(88, 19)
        Me.Label9.TabIndex = 12
        Me.Label9.Text = "Scale Value"
        '
        'Label10
        '
        Me.Label10.AutoSize = True
        Me.Label10.Location = New System.Drawing.Point(111, 448)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(83, 19)
        Me.Label10.TabIndex = 13
        Me.Label10.Text = "New Width"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(111, 480)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(88, 19)
        Me.Label1.TabIndex = 14
        Me.Label1.Text = "New Height"
        '
        'txNewHeight
        '
        Me.txNewHeight.Location = New System.Drawing.Point(264, 477)
        Me.txNewHeight.Name = "txNewHeight"
        Me.txNewHeight.Size = New System.Drawing.Size(100, 26)
        Me.txNewHeight.TabIndex = 18
        '
        'txNewWidth
        '
        Me.txNewWidth.Location = New System.Drawing.Point(264, 445)
        Me.txNewWidth.Name = "txNewWidth"
        Me.txNewWidth.Size = New System.Drawing.Size(100, 26)
        Me.txNewWidth.TabIndex = 17
        '
        'txScaleValue
        '
        Me.txScaleValue.Location = New System.Drawing.Point(264, 413)
        Me.txScaleValue.Name = "txScaleValue"
        Me.txScaleValue.Size = New System.Drawing.Size(100, 26)
        Me.txScaleValue.TabIndex = 16
        Me.txScaleValue.Text = "1"
        '
        'BarScaling
        '
        Me.BarScaling.LargeChange = 50
        Me.BarScaling.Location = New System.Drawing.Point(264, 362)
        Me.BarScaling.Maximum = 1000
        Me.BarScaling.Minimum = 10
        Me.BarScaling.Name = "BarScaling"
        Me.BarScaling.Size = New System.Drawing.Size(243, 45)
        Me.BarScaling.TabIndex = 19
        Me.BarScaling.Value = 100
        '
        'btnPrint
        '
        Me.btnPrint.Location = New System.Drawing.Point(432, 413)
        Me.btnPrint.Name = "btnPrint"
        Me.btnPrint.Size = New System.Drawing.Size(75, 90)
        Me.btnPrint.TabIndex = 20
        Me.btnPrint.Text = "Print Test Page"
        Me.btnPrint.UseVisualStyleBackColor = True
        '
        'btnGetInfo
        '
        Me.btnGetInfo.Location = New System.Drawing.Point(432, 109)
        Me.btnGetInfo.Name = "btnGetInfo"
        Me.btnGetInfo.Size = New System.Drawing.Size(75, 117)
        Me.btnGetInfo.TabIndex = 21
        Me.btnGetInfo.Text = "Get Current Page Info"
        Me.btnGetInfo.UseVisualStyleBackColor = True
        '
        'frmPrinters
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(9.0!, 19.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(618, 590)
        Me.Controls.Add(Me.btnGetInfo)
        Me.Controls.Add(Me.btnPrint)
        Me.Controls.Add(Me.BarScaling)
        Me.Controls.Add(Me.txNewHeight)
        Me.Controls.Add(Me.txNewWidth)
        Me.Controls.Add(Me.txScaleValue)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.Label10)
        Me.Controls.Add(Me.Label9)
        Me.Controls.Add(Me.txPHeight)
        Me.Controls.Add(Me.txPWidth)
        Me.Controls.Add(Me.txPSize)
        Me.Controls.Add(Me.txPName)
        Me.Controls.Add(Me.Label8)
        Me.Controls.Add(Me.Label7)
        Me.Controls.Add(Me.Label6)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Font = New System.Drawing.Font("Times New Roman", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Margin = New System.Windows.Forms.Padding(4)
        Me.Name = "frmPrinters"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "...::: My Egent ::: Printers :::..."
        CType(Me.BarScaling, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents txPName As System.Windows.Forms.TextBox
    Friend WithEvents txPSize As System.Windows.Forms.TextBox
    Friend WithEvents txPWidth As System.Windows.Forms.TextBox
    Friend WithEvents txPHeight As System.Windows.Forms.TextBox
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents txNewHeight As System.Windows.Forms.TextBox
    Friend WithEvents txNewWidth As System.Windows.Forms.TextBox
    Friend WithEvents txScaleValue As System.Windows.Forms.TextBox
    Friend WithEvents BarScaling As System.Windows.Forms.TrackBar
    Friend WithEvents btnPrint As System.Windows.Forms.Button
    Friend WithEvents btnGetInfo As System.Windows.Forms.Button


End Class

Option Strict Off
Option Explicit On
Friend Class Test_InpOut32
    Inherits System.Windows.Forms.Form
#Region "Windows Form Designer generated code "
    Public Sub New()
        MyBase.New()
        If m_vb6FormDefInstance Is Nothing Then
            If m_InitializingDefInstance Then
                m_vb6FormDefInstance = Me
            Else
                Try
                    'For the start-up form, the first instance created is the default instance.
                    If System.Reflection.Assembly.GetExecutingAssembly.EntryPoint.DeclaringType Is Me.GetType Then
                        m_vb6FormDefInstance = Me
                    End If
                Catch
                End Try
            End If
        End If
        'This call is required by the Windows Form Designer.
        InitializeComponent()
    End Sub
    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal Disposing As Boolean)
        If Disposing Then
            If Not components Is Nothing Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(Disposing)
    End Sub
    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer
    Public ToolTip1 As System.Windows.Forms.ToolTip
    Public WithEvents Text1 As System.Windows.Forms.TextBox
    Public WithEvents cmdWriteToPort As System.Windows.Forms.Button
    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Test_InpOut32))
        Me.components = New System.ComponentModel.Container()
        Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
        Me.ToolTip1.Active = True
        Me.Text1 = New System.Windows.Forms.TextBox()
        Me.cmdWriteToPort = New System.Windows.Forms.Button()
        Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual
        Me.Text = "Test Inpout32"
        Me.ClientSize = New System.Drawing.Size(270, 141)
        Me.Location = New System.Drawing.Point(76, 117)
        Me.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.AutoScaleBaseSize = New System.Drawing.Size(6, 15)
        Me.BackColor = System.Drawing.SystemColors.Control
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Sizable
        Me.ControlBox = True
        Me.Enabled = True
        Me.KeyPreview = False
        Me.MaximizeBox = True
        Me.MinimizeBox = True
        Me.Cursor = System.Windows.Forms.Cursors.Default
        Me.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.ShowInTaskbar = True
        Me.HelpButton = False
        Me.WindowState = System.Windows.Forms.FormWindowState.Normal
        Me.Name = "Test_InpOutt32"
        Me.Text1.AutoSize = False
        Me.Text1.Size = New System.Drawing.Size(171, 31)
        Me.Text1.Location = New System.Drawing.Point(10, 90)
        Me.Text1.TabIndex = 1
        Me.Text1.Text = "Text1"
        Me.Text1.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Text1.AcceptsReturn = True
        Me.Text1.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
        Me.Text1.BackColor = System.Drawing.SystemColors.Window
        Me.Text1.CausesValidation = True
        Me.Text1.Enabled = True
        Me.Text1.ForeColor = System.Drawing.SystemColors.WindowText
        Me.Text1.HideSelection = True
        Me.Text1.ReadOnly = False
        Me.Text1.MaxLength = 0
        Me.Text1.Cursor = System.Windows.Forms.Cursors.IBeam
        Me.Text1.Multiline = False
        Me.Text1.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.Text1.ScrollBars = System.Windows.Forms.ScrollBars.None
        Me.Text1.TabStop = True
        Me.Text1.Visible = True
        Me.Text1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Text1.Name = "Text1"
        Me.cmdWriteToPort.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        Me.cmdWriteToPort.Text = "Write to Port"
        Me.cmdWriteToPort.Size = New System.Drawing.Size(161, 61)
        Me.cmdWriteToPort.Location = New System.Drawing.Point(20, 10)
        Me.cmdWriteToPort.TabIndex = 0
        Me.cmdWriteToPort.Font = New System.Drawing.Font("Arial", 8.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmdWriteToPort.BackColor = System.Drawing.SystemColors.Control
        Me.cmdWriteToPort.CausesValidation = True
        Me.cmdWriteToPort.Enabled = True
        Me.cmdWriteToPort.ForeColor = System.Drawing.SystemColors.ControlText
        Me.cmdWriteToPort.Cursor = System.Windows.Forms.Cursors.Default
        Me.cmdWriteToPort.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.cmdWriteToPort.TabStop = True
        Me.cmdWriteToPort.Name = "cmdWriteToPort"
        Me.Controls.Add(Text1)
        Me.Controls.Add(cmdWriteToPort)
    End Sub
#End Region
#Region "Upgrade Support "
    Private Shared m_vb6FormDefInstance As Test_InpOut32
    Private Shared m_InitializingDefInstance As Boolean
    Public Shared Property DefInstance() As Test_InpOut32
        Get
            If m_vb6FormDefInstance Is Nothing OrElse m_vb6FormDefInstance.IsDisposed Then
                m_InitializingDefInstance = True
                m_vb6FormDefInstance = New Test_InpOut32()
                m_InitializingDefInstance = False
            End If
            DefInstance = m_vb6FormDefInstance
        End Get
        Set(ByVal Value As Test_InpOut32)
            m_vb6FormDefInstance = Value
        End Set
    End Property
#End Region
    Dim Value As Short
    Dim PortAddress As Short
    Private Sub cmdWriteToPort_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmdWriteToPort.Click
        'Write to a port.
        Out(PortAddress, Value)
        'Read back and display the result.
        Text1.Text = CStr(Inp(PortAddress))
        Value = Value + 1
        If Value = 255 Then Value = 0
    End Sub
    Private Sub Test_InpOutt32_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
        'Test program for inpout32.dll
        Value = 0
        'Change PortAddress to match the port address to write to:
        '(Usual parallel-port addresses are &h378, &h278, &h3BC)
        PortAddress = &H378S
    End Sub
End Class
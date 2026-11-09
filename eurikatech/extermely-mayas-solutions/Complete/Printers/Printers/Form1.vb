Public Class frmPrinters
    Dim WithEvents Pr As New Printing.PrintDocument
    Private Sub btnGetInfo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGetInfo.Click

        txPName.Text = Pr.PrinterSettings.PrinterName
        txPSize.Text = Pr.DefaultPageSettings.PaperSize.Kind.ToString
        txPWidth.Text = Pr.DefaultPageSettings.Bounds.Width.ToString
        txPHeight.Text = Pr.DefaultPageSettings.Bounds.Height.ToString

    End Sub

    Private Sub BarScaling_Scroll(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BarScaling.Scroll

        Dim SelValue As Double

        SelValue = (BarScaling.Value / 100)
        txScaleValue.Text = SelValue.ToString
        txNewWidth.Text = (SelValue * Pr.DefaultPageSettings.Bounds.Width).ToString
        txNewHeight.Text = (SelValue * Pr.DefaultPageSettings.Bounds.Height).ToString

    End Sub

    Private Sub btnPrint_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPrint.Click
        Pr.Print()
    End Sub

    Private Sub Pr_PrintPage(ByVal sender As Object, ByVal e As Printing.PrintPageEventArgs) Handles Pr.PrintPage
        Dim Gr As Graphics
        Gr = e.Graphics
        Gr.PageScale = CSng(txScaleValue.Text)

        Dim Br As New SolidBrush(Color.Black)
        Dim ShpSize, HShpSize, VShpSize As Size
        ShpSize = New Size(5, 5)
        HShpSize = New Size(20, 5)
        VShpSize = New Size(5, 20)

        'draw base shaps
        Gr.FillRectangle(Br, 0, 0, ShpSize.Width, ShpSize.Height)
        Gr.FillRectangle(Br, e.PageBounds.Width - ShpSize.Width, 0, ShpSize.Width, ShpSize.Height)
        Gr.FillRectangle(Br, 0, e.PageBounds.Height - ShpSize.Height, ShpSize.Width, ShpSize.Height)
        Gr.FillRectangle(Br, e.PageBounds.Width - ShpSize.Width, e.PageBounds.Height - ShpSize.Height, ShpSize.Width, ShpSize.Height)

        'draw horezontal shaps
        Gr.FillRectangle(Br, ShpSize.Width, 0, HShpSize.Width, HShpSize.Height)
        Gr.FillRectangle(Br, e.PageBounds.Width - (HShpSize.Width + ShpSize.Width), 0, HShpSize.Width, HShpSize.Height)
        Gr.FillRectangle(Br, ShpSize.Width, e.PageBounds.Height - ShpSize.Height, HShpSize.Width, HShpSize.Height)
        Gr.FillRectangle(Br, e.PageBounds.Width - (HShpSize.Width + ShpSize.Width), e.PageBounds.Height - ShpSize.Height, HShpSize.Width, HShpSize.Height)

        'draw vertical shapes
        Gr.FillRectangle(Br, 0, ShpSize.Height, VShpSize.Width, VShpSize.Height)
        Gr.FillRectangle(Br, e.PageBounds.Width - ShpSize.Width, ShpSize.Height, VShpSize.Width, VShpSize.Height)
        Gr.FillRectangle(Br, 0, e.PageBounds.Height - (ShpSize.Height + VShpSize.Height), VShpSize.Width, VShpSize.Height)
        Gr.FillRectangle(Br, e.PageBounds.Width - ShpSize.Width, e.PageBounds.Height - (ShpSize.Height + VShpSize.Height), VShpSize.Width, VShpSize.Height)


    End Sub
End Class

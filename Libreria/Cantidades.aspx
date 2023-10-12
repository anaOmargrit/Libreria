<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cantidades.aspx.cs" Inherits="Libreria.Cantidades" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Libros.aspx">Ir a Libros</asp:HyperLink>
            <br />
            <br />
            Cantidad de libros cargados por género:<br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ds_cantidades" ForeColor="#333333" GridLines="None" Width="506px" EmptyDataText="No se han encontrado datos.">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="descripcion" HeaderText="Género" SortExpression="descripcion" />
                    <asp:BoundField DataField="cantidad" HeaderText="Cantidad" ReadOnly="True" SortExpression="cantidad" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="ds_cantidades" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="select count(*) cantidad, lg.descripcion
from libros l, librogeneros lg
where lg.id = l.idGenero
group by lg.descripcion
order by 1"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>

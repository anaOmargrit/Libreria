<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Generos.aspx.cs" Inherits="Libreria.Generos" %>

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

            Nuevo Género:

            <br />
            <br />
            Descripción:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="tb_descripcion" runat="server"></asp:TextBox>

            <br />
            <br />
            <asp:Button ID="bt_crear" runat="server" Text="Crear" OnClick="bt_crear_Click" />

            <br />
            <br />
            <asp:Label ID="lb_mensaje" runat="server" Text=""></asp:Label>

            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ds_generos" Width="704px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleted="GridView1_RowDeleted" OnRowUpdated="GridView1_RowUpdated" EmptyDataText="No se han encontrado datos." CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="Nro. de Género" ReadOnly="True" SortExpression="id" InsertVisible="False" />
                    <asp:BoundField DataField="descripcion" HeaderText="Descripción" SortExpression="descripcion" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
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
            <br />
            <asp:SqlDataSource ID="ds_generos" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" DeleteCommand="DELETE FROM [LibroGeneros] WHERE [id] = @id" InsertCommand="INSERT INTO [LibroGeneros] ([descripcion]) VALUES (@descripcion)" SelectCommand="SELECT id, descripcion FROM [LibroGeneros]" UpdateCommand="UPDATE [LibroGeneros] SET [descripcion] = @descripcion WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:ControlParameter ControlID="tb_descripcion" Name="descripcion" PropertyName="Text" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libros.aspx.cs" Inherits="Libreria.Libros" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Generos.aspx">Ir a Géneros</asp:HyperLink>
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Cantidades.aspx">Ir a Cantidad por Género</asp:HyperLink>

            <br />
            <br />

            Nuevo Libro:
            <br />
            <br />
            Título:&nbsp;&nbsp;
            <asp:TextBox ID="tb_titulo" runat="server"></asp:TextBox>
            <br />
            Género:&nbsp;&nbsp;
            <asp:DropDownList ID="ddl_generos" runat="server" DataSourceID="ds_generos" DataTextField="descripcion" DataValueField="id" Height="19px" Width="148px" AutoPostBack="True">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="bt_crear" runat="server" Text="Crear" OnClick="bt_crear_Click" />
            &nbsp;
            <asp:Button ID="bt_actualizar" runat="server" Text="Actualizar" OnClick="bt_actualizar_Click" />
            <br />
            <br />
            <asp:Label ID="lb_mensaje" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="ds_libros" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDeleted="GridView1_RowDeleted" Width="718px" CellPadding="4" ForeColor="#333333" GridLines="None" EmptyDataText="No se han encontrado datos.">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="Nro. de Libro" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="titulo" HeaderText="Título" SortExpression="titulo" />
                    <asp:BoundField DataField="idGenero" HeaderText="Nro. Género" SortExpression="idGenero" />
                    <asp:BoundField DataField="descripcion" HeaderText="Género" SortExpression="descripcion" />
                    <asp:CommandField ButtonType="Button" SelectText="Ver" ShowDeleteButton="True" ShowSelectButton="True" />
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
            <asp:SqlDataSource ID="ds_generos" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="SELECT id, descripcion FROM [LibroGeneros]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="ds_libros" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" DeleteCommand="DELETE FROM [libros] WHERE [id] = @id" InsertCommand="INSERT INTO [libros] ([titulo], [idGenero]) VALUES (@titulo, @idGenero)" SelectCommand="SELECT libros.id, libros.titulo, LibroGeneros.descripcion, libros.idGenero FROM libros INNER JOIN LibroGeneros ON libros.idGenero = LibroGeneros.id" UpdateCommand="UPDATE [libros] SET [titulo] = @titulo, [idGenero] = @idGenero WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="tb_titulo" Name="titulo" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="ddl_generos" Name="idGenero" PropertyName="SelectedValue" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="tb_titulo" Name="titulo" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="ddl_generos" Name="idGenero" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>

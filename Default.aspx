<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./style.css" />
    <title>Twitch Database Front-End</title>
</head>
<body>     
    <form runat="server">
        <div class="container">
            <h1>Twitch Database Front-End</h1>

            <!--Form for adding to community-->
            <h4 id="form-header">Create a New Twitch Community</h4>
            <asp:FormView ID="AddCommunityForm" CssClass="panel panel-default" runat="server" DataKeyNames="CommunityID" DataSourceID="CommunitySource" DefaultMode="Insert">
                <InsertItemTemplate>
                    <div class="form-group">
                        <label for="CommunityNameTextBox" class="col-md-3 control-label">Name</label>
                        <div class="col-md-9">
                            <asp:TextBox ID="CommunityNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CommunityName") %>' />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="CommunityDescTextBox" class="col-md-3 control-label">Description</label>
                        <div class="col-md-9">
                            <asp:TextBox ID="CommunityDescTextBox" CssClass="form-control" runat="server" Text='<%# Bind("CommunityDesc") %>' />
                        </div>
                    </div>
                    
                    <asp:LinkButton ID="InsertButton" CssClass="btn btn-primary formBtn" runat="server" CausesValidation="True" CommandName="Insert" Text="Add Community" />
                    <asp:LinkButton ID="CancelButton" CssClass="btn formBtn" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
            </asp:FormView>
        
            <!--Display rows in community table-->
            <asp:GridView ID="CommunityTable" CssClass="table" runat="server" AutoGenerateColumns="False" DataSourceID="CommunitySource" DataKeyNames="CommunityID">
                <Columns>
                    <asp:BoundField DataField="CommunityName" HeaderText="Name" SortExpression="CommunityName" />
                    <asp:BoundField DataField="CommunityDesc" HeaderText="Description" SortExpression="CommunityDesc" />
                    <asp:CommandField ControlStyle-CssClass="tableBtn" ShowEditButton="True" ShowDeleteButton="True"/>
                </Columns>
            </asp:GridView>

            <!--Community data source-->
            <asp:SqlDataSource ID="CommunitySource" runat="server" ConnectionString="<%$ ConnectionStrings:TwitchConnectionString1 %>" SelectCommand="SELECT * FROM [COMMUNITY]" DeleteCommand="DELETE FROM [COMMUNITY] WHERE [CommunityID] = @CommunityID" InsertCommand="INSERT INTO [COMMUNITY] ([CommunityName], [CommunityDesc]) VALUES (@CommunityName, @CommunityDesc)" UpdateCommand="UPDATE [COMMUNITY] SET [CommunityName] = @CommunityName, [CommunityDesc] = @CommunityDesc WHERE [CommunityID] = @CommunityID">
                <DeleteParameters>
                    <asp:Parameter Name="CommunityID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CommunityName" Type="String" />
                    <asp:Parameter Name="CommunityDesc" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CommunityName" Type="String" />
                    <asp:Parameter Name="CommunityDesc" Type="String" />
                    <asp:Parameter Name="CommunityID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>

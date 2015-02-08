<%
    session = request.getSession();
    session.invalidate();
%>
<body>
<center>
    <h1>Logout</h1>
    You have successfully logged out.
    Please click <a href="auth/index.xhtml">here</a> for another login.
</center>
</body>
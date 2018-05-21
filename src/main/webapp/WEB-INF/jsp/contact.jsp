<%@ taglib uri="http://www.springframework.org/tags/form" prefix="springForm"%>

<style>
    .error {
        color: #ff0000;
        font-style: italic;
    }
    table tr td {
        border: none !important;
    }
</style>
<springForm:form method="POST" commandName="user" action="${home}sendMail">
    <table class="table table-responsive" >
        <tr>
            <td>Name:</td>
            <td><springForm:input path="name" cssClass="form-control" /></td>
            <td><springForm:errors path="name" cssClass="error" /></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><springForm:input path="email" cssClass="form-control" /></td>
            <td><springForm:errors path="email" cssClass="error" /></td>
        </tr>
        <tr>
            <td>Message:</td>
            <td><springForm:textarea path="message" cssClass="form-control" rows="7" cols="30" /></td>
            <td><springForm:errors path="message" cssClass="error" /></td>
        </tr>
        <tr>
            <td colspan="3"><input type="submit" value="Send email" class="btn btn-primary"></td>
        </tr>
    </table>
</springForm:form>

<h5 style="color: blue">${notif}</h5><br/>




<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Tables</h1>
        <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
            For more information about DataTables, please visit the <a target="_blank"
                                                                       href="https://datatables.net">official DataTables
                documentation</a>.</p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>img</th>
                            <th>id</th>
                            <th>name</th>
                            <th>price</th>
                            <th>regdate</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="obj" items="${allitem}">
                            <tr>
                                <td><img src="/img/${obj.imgname}" style="width:50px; height:50px"></td>
                                <td><a href="/item/get?id=${obj.id}">${obj.id}</a></td>
                                <td>${obj.name}</td>
                                <td><fmt:formatNumber value="${obj.price}" type="currency"/></td>
                                <td><fmt:formatDate value="${obj.regdate}" pattern="yyyy-MM-dd"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<%--<!-- Bootstrap core JavaScript-->--%>
<%--<script src="vendor/jquery/jquery.min.js"></script>--%>
<%--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>

<%--<!-- Core plugin JavaScript-->--%>
<%--<script src="vendor/jquery-easing/jquery.easing.min.js"></script>--%>

<%--<!-- Custom scripts for all pages-->--%>
<%--<script src="js/sb-admin-2.min.js"></script>--%>

<%--<!-- Page level plugins -->--%>
<%--<script src="vendor/datatables/jquery.dataTables.min.js"></script>--%>
<%--<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>--%>

<%--<!-- Page level custom scripts -->--%>
<%--<script src="js/demo/datatables-demo.js"></script>--%>
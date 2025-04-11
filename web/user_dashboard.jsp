<%@ page import="com.example.DataBaseJDBC" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <!-- Подключение Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .search-bar {
            margin-bottom: 20px;
        }
        .table tbody tr:nth-child(odd) {
            background-color: #f8f9fa;
        }
        .table tbody tr:hover {
            background-color: #e9ecef;
        }
    </style>
</head>
<body>
<!-- Панель навигации -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Основной контент -->
<div class="container mt-4">
    <h2 class="text-center text-success mb-4">Welcome, User!</h2>

    <!-- Поиск читателей -->
    <div class="search-bar">
        <input type="text" id="searchInput" class="form-control" placeholder="Search by name...">
    </div>

    <!-- Таблица читателей -->
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
        </tr>
        </thead>
        <tbody id="readerTable">
        <%
            try {
                ResultSet readers = DataBaseJDBC.getAllReaders();
                while (readers.next()) {
        %>

        <tr>
            <td><%= readers.getInt("id_reader") %></td>
            <td><%= readers.getString("firstname") %></td>
            <td><%= readers.getString("lastname") %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        </tbody>
    </table>
</div>

<!-- JavaScript для поиска -->
<script>
    document.getElementById('searchInput').addEventListener('input', function () {
        const filter = this.value.toLowerCase();
        const rows = document.querySelectorAll('#readerTable tr');
        rows.forEach(row => {
            const firstName = row.cells[1].textContent.toLowerCase();
            const lastName = row.cells[2].textContent.toLowerCase();
            if (firstName.includes(filter) || lastName.includes(filter)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });
</script>
</body>
</html>
<%@ page import="com.example.DataBaseJDBC" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
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
    <h2 class="text-center text-primary mb-4">Admin Dashboard</h2>

    <!-- Поиск пользователей -->
    <div class="search-bar">
        <input type="text" id="searchInput" class="form-control" placeholder="Search by name or role...">
    </div>

    <!-- Таблица пользователей -->
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Password</th>
            <th>Role</th>
        </tr>
        </thead>
        <tbody id="userTable">
        <%
            try {
                ResultSet users = DataBaseJDBC.getAllUsers();
                while (users.next()) {
        %>
        <tr>
            <td><%= users.getInt("id") %></td>
            <td><%= users.getString("name") %></td>
            <td><%= users.getString("pass") %></td>
            <td><%= users.getString("role") %></td>
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
        const rows = document.querySelectorAll('#userTable tr');
        rows.forEach(row => {
            const name = row.cells[1].textContent.toLowerCase();
            const role = row.cells[4].textContent.toLowerCase();
            if (name.includes(filter) || role.includes(filter)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });
</script>
</body>
</html>
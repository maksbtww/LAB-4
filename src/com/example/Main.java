package com.example;

public class Main {
    public static void main(String[] args) {
        try {
            DataBaseJDBC.printUsersTable();
        } catch (Exception e) {
            System.err.println("Ошибка при запуске программы:");
            e.printStackTrace();
        }
    }
}